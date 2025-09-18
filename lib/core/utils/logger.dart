import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';

import 'package:logging/logging.dart' as logging;

final logger = AppLogger();

class AppLogger extends Logger {
  AppLogger({bool isEnabled = true})
    : super(
        printer: LoggerService(
          className: 'CBN_MCP_Server',
          isEnabled: isEnabled,
        ),
      );

  void initialize() {
    // Setup logging

    logging.Logger.root.level = logging.Level.ALL;
    logging.Logger.root.onRecord.listen((record) {
      stderr.writeln('${record.level.name}: ${record.time}: ${record.message}');
      if (record.error != null) {
        stderr.writeln('Error: ${record.error}');
      }
      if (record.stackTrace != null) {
        stderr.writeln('Stack trace: ${record.stackTrace}');
      }
    });
  }
}

class LoggerService extends LogPrinter {
  LoggerService({this.className, this.isEnabled = true});

  final String? className;
  bool isEnabled;

  @override
  List<String> log(LogEvent event) {
    if (!isEnabled || bool.fromEnvironment('dart.vm.product')) {
      return [];
    }

    final emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    final color = PrettyPrinter.defaultLevelColors[event.level];

    final message = stringifyMessage(event.message);

    return [Platform.isIOS ? '$emoji$message\n' : color!('$emoji$message\n')];
  }

  String? stringifyMessage(dynamic message) {
    const decoder = JsonDecoder();
    const encoder = JsonEncoder.withIndent('  ');
    const color = AnsiColor.fg(15);

    if (message is String) {
      try {
        if (message.contains(':') == false ||
            message.contains('->') && (!message.contains('{')) ||
            !message.contains('"')) {
          return message;
        }

        final raw = decoder.convert(message);
        return color(encoder.convert(raw));
      } catch (e) {
        return message.toString();
      }
    } else if (message is Map || message is Iterable) {
      return color(encoder.convert(message));
    } else {
      return message.toString();
    }
  }

  LoggerService copyWith({String? className}) {
    return LoggerService(className: className ?? this.className);
  }
}

String jsonPretty(dynamic obj) {
  String prettyprint;

  if (obj is Map ||
      obj is Map<dynamic, dynamic> ||
      obj is Map<String, dynamic>) {
    const encoder = JsonEncoder.withIndent('  ');
    prettyprint = encoder.convert(obj);
  } else {
    prettyprint = '$obj';
  }

  return prettyprint;
}
