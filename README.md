# CBN MCP Server 🏦

![CBN MCP Server](image.png)

A Model Context Protocol (MCP) server for accessing Central Bank of Nigeria (CBN) data and circulars. Connect this server to Cursor, Claude Desktop, or any MCP-compatible application to access CBN regulatory information directly in your AI conversations. 🚀

**Built with [mcp_server_dart](https://pub.dev/packages/mcp_server_dart)** - A developer-friendly MCP framework for Dart with annotations and code generation that I created. 💪

## Features ✨

### MCP Tools 🛠️

#### Circulars Tools 📋
- **getAllCirculars**: Fetch all CBN circulars with optional filtering by date range and category 📋
- **getCircularById**: Get a specific CBN circular by its ID 🔍
- **searchCirculars**: Search CBN circulars by title or description keywords 🔎
- **fetchCircularPdf**: Download and read PDF content of CBN circulars 📄
- **fetchCircularPdfById**: Download PDF content by circular ID 📥
- **getCircularPdfUrl**: Get the direct download URL for a CBN circular PDF by its ID 🔗
- **getCircularsForLLMAnalysis**: Get recent CBN circulars with PDF URLs formatted for LLM analysis 🤖

#### Exchange Rates Tools 💱
- **getAllExchangeRates**: Fetch all CBN exchange rates with optional filtering by date range and currency 💱
- **getExchangeRateById**: Get a specific CBN exchange rate by its ID 🔍

#### Financial Data Tools 📊
- **getAllFinancialData**: Fetch all CBN financial data with optional filtering by date range and financial metrics 📊
- **getFinancialDataById**: Get a specific CBN financial data by its ID 🔍

### MCP Resources 📚
- **cbnApiStatus**: Current status and health of the CBN API connection 💚
- **serverInfo**: Information about this CBN MCP server ℹ️
- **availableCircularPdfs**: List of available circular PDFs with their URIs 📄
- **randomFact**: A random fact about the CBN 🎲

### MCP Prompts 💬
- **circularSummary**: Generate a summary prompt for CBN circulars analysis 📊
- **regulatoryAnalysis**: Generate prompts for regulatory compliance analysis of CBN circulars ⚖️

## Quick Start 🚀

### Option 1: Download Pre-built Binary (Easiest) ⚡
1. Go to [Releases](https://github.com/chiziaruhoma/cbn_mcp/releases) 📦
2. Download the `cbn_mcp` executable ⬇️
3. Make it executable: `chmod +x cbn_mcp` 🔧
4. Use path: `/path/to/cbn_mcp` 📁

### Option 2: Run with Dart (If you have Dart installed) 🎯
1. Clone this repository: `git clone https://github.com/chiziaruhoma/cbn_mcp.git` 📂
2. Navigate to directory: `cd cbn_mcp` 📍
3. Install dependencies: `dart pub get` 📦
4. Use command: `dart run bin/main.dart` ▶️

### Option 3: Build from Source 🔨
1. Follow Option 2 steps 1-3 ⬆️
2. Build executable: `dart compile exe bin/main.dart -o cbn_mcp` 🏗️
3. Use path: `/path/to/cbn_mcp` 📁

## Integration with AI Applications 🤖

### Cursor IDE 💻

1. Open Cursor settings (Cmd/Ctrl + ,) ⚙️
2. Go to "Features" → "Model Context Protocol" 🔧
3. Add a new MCP server with **one of these configurations**: 📝

   **Using pre-built binary:** ⚡
   ```json
   {
     "name": "cbn-mcp",
     "command": "/path/to/cbn_mcp"
   }
   ```

   **Using Dart (if you have Dart installed):** 🎯
   ```json
   {
     "name": "cbn-mcp",
     "command": "dart",
     "args": ["run", "bin/main.dart"],
     "cwd": "/path/to/cbn_mcp"
   }
   ```

4. Restart Cursor 🔄
5. Now you can ask questions like: "What are the latest CBN circulars?" or "Find CBN regulations about forex trading" 💬

### Claude Desktop 🖥️

1. Open Claude Desktop settings ⚙️
2. Navigate to the MCP servers configuration 🔧
3. Add the CBN MCP server with **one of these configurations**: 📝

   **Using pre-built binary:** ⚡
   ```json
   {
     "mcpServers": {
       "cbn-mcp": {
         "command": "/path/to/cbn_mcp"
       }
     }
   }
   ```

   **Using Dart (if you have Dart installed):** 🎯
   ```json
   {
     "mcpServers": {
       "cbn-mcp": {
         "command": "dart",
         "args": ["run", "bin/main.dart"],
         "cwd": "/path/to/cbn_mcp"
       }
     }
   }
   ```

4. Restart Claude Desktop 🔄
5. The CBN tools will be available in your conversations 🎉

### Other MCP-Compatible Applications 🌐

For any application that supports MCP: 🔌
1. Add the server configuration pointing to the `cbn_mcp` executable 📝
2. The server will expose CBN data access tools to your AI assistant 🤖

## Usage Examples 💡

Once integrated, you can ask your AI assistant: 🗣️

### Circulars Examples 📋
- "What are the latest CBN circulars from this month?" 📅
- "Find all CBN regulations related to cryptocurrency" 💰
- "Get me the details of CBN circular BSD/DIR/GEN/LAB/11/020" 🔍
- "Summarize the key points from recent CBN monetary policy circulars" 📊
- "What are the compliance requirements for banks based on recent CBN circulars?" ⚖️

### Exchange Rates Examples 💱
- "What is the current USD/NGN exchange rate?" 💵
- "Show me the exchange rates for the past week" 📈
- "Get the official CBN rate for EUR to NGN" 💶

### Financial Data Examples 📊
- "What are the current CBN monetary policy parameters?" 🏛️
- "Show me the repo rates for the last month" 📊
- "What is the current cash reserve ratio?" 💰
- "Get the opening balance data for this quarter" 📅

## Development 👨‍💻

### Prerequisites 📋
- Dart SDK ^3.9.2
- Git

### Setup 🛠️
1. Clone the repository:
   ```bash
   git clone https://github.com/chiziaruhoma/cbn_mcp.git
   cd cbn_mcp
   ```

2. Install dependencies:
   ```bash
   dart pub get
   ```

3. Generate mappable classes (if needed):
   ```bash
   dart run build_runner build
   ```

### Running the Server ▶️
```bash
# Run directly with Dart
dart run bin/main.dart

# Or build and run executable
dart compile exe bin/main.dart -o cbn_mcp
./cbn_mcp
```

### Testing 🧪
```bash
dart test
```

### Building for Distribution 📦
```bash
# Build executable
dart compile exe bin/main.dart -o cbn_mcp

# The executable can be distributed and run on any compatible system
```

### Project Structure 📁
```
lib/
├── cbn.dart              # Main MCP server class
├── cbn.mcp.dart          # Generated MCP annotations
├── core/
│   ├── api/
│   │   └── api_client.dart    # HTTP client for CBN API
│   └── utils/
│       └── logger.dart        # Logging utilities
├── models/               # Data models with mappable annotations
│   ├── circular.dart     # Circular data models
│   ├── financials.dart   # Financial data models
│   ├── rates.dart        # Exchange rates models
│   ├── random.dart       # Random fact models
│   └── models.dart       # Base model classes
└── services/             # Business logic services
    ├── circulars.dart    # Circulars API service
    ├── financials.dart   # Financial data service
    ├── rates.dart        # Exchange rates service
    ├── prompt.dart       # MCP prompt service
    ├── status.dart       # Status and info service
    └── services.dart     # Base service classes
```

### Contributing 🤝
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### API Documentation 📖
This project integrates with the Central Bank of Nigeria's public API. For more information about the available endpoints, visit the [CBN Developer Portal](https://www.cbn.gov.ng/api).

## License 📄
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments 🙏
- Central Bank of Nigeria for providing the public API
- The MCP community for the protocol specification
- [mcp_server_dart](https://pub.dev/packages/mcp_server_dart) for the Dart MCP framework