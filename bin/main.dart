#!/usr/bin/env dart

import 'dart:io';
import 'package:cbn_mcp/core/utils/logger.dart';
import 'package:cbn_mcp/cbn.dart';

void main(List<String> arguments) async {
  try {
    logger
      ..initialize()
      ..i('Starting CBN MCP Server...');

    // Create and start the server
    final server = NGCentralBankMCPServer()..registerGeneratedHandlers();
    server.showUsage();

    // Start the server (this will handle stdin/stdout communication)
    server
      ..stdio()
      ..serve();
  } catch (e, stackTrace) {
    logger.e('Failed to start CBN MCP Server: $e');
    logger.e('Stack trace: $stackTrace');
    exit(1);
  }
}

