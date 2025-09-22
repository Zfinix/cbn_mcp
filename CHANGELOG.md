## 1.0.0

### ✨ New Features

#### Exchange Rates Tools 💱
- **getAllExchangeRates**: Fetch all CBN exchange rates with optional filtering by date range and currency
- **getExchangeRateById**: Get a specific CBN exchange rate by its ID

#### Financial Data Tools 📊
- **getAllFinancialData**: Fetch all CBN financial data with optional filtering by date range and financial metrics (opening balance, repo rates, cash reserve ratio)
- **getFinancialDataById**: Get a specific CBN financial data by its ID

#### Enhanced Circular Tools 📋
- **getCircularPdfUrl**: Get the direct download URL for a CBN circular PDF by its ID
- **getCircularsForLLMAnalysis**: Get recent CBN circulars with PDF URLs formatted specifically for LLM analysis

#### New MCP Resources 📚
- **availableCircularPdfs**: List of available circular PDFs with their URIs
- **randomFact**: A random fact about the CBN

### 📚 Documentation
- Complete README update with comprehensive usage examples
- Added development setup and contribution guidelines
- Organized features by category for better discoverability

### 🔧 Technical Improvements
- Added FinancialsService for CBN financial data management
- Added RatesService for exchange rates functionality
- Added RandomService for CBN facts and information
- Enhanced StatusService with random fact generation
- Comprehensive data models with mappable annotations for all new services
- Improved error handling and API response formatting

### 📦 Dependencies
- Updated to use latest mcp_server_dart framework
- Added comprehensive logging and error handling utilities

### 🚀 Initial Release
- Core MCP server implementation with CBN API integration
- Basic circulars functionality (getAllCirculars, getCircularById, searchCirculars)
- PDF fetching capabilities (fetchCircularPdf, fetchCircularPdfById, downloadCircularPdfBinary)
- API status monitoring and server information resources
- MCP prompts for circular analysis and regulatory compliance
