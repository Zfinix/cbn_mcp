# CBN MCP Server Test Prompt

This prompt will help you test all the capabilities of the Central Bank of Nigeria (CBN) MCP server, including the new PDF fetching functionality.

## 🎯 Test Scenario: Financial Compliance Analysis

**Context**: You are a compliance officer at a Nigerian bank who needs to analyze recent CBN circulars and their PDF documents for regulatory updates.

## 📋 Test Steps

### 1. **Explore Recent Circulars**
```
Please help me get the 5 most recent CBN circulars. I want to see their titles, dates, and reference numbers.
```

### 2. **Search for Specific Topics**
```
Search for CBN circulars related to "payment" or "digital banking" - I need to understand recent payment system regulations.
```

### 3. **Get Detailed Circular Information**
```
Can you get me the full details of circular ID 7864? I need all available information about this circular.
```

### 4. **Fetch and Analyze PDF Content**
```
Please fetch the PDF document for the "Appointment and Announcement of Successors to Managing Director" circular. I need to:
- Download the PDF content
- Tell me the file size
- Confirm it's a valid PDF document

The URL should be: https://www.cbn.gov.ng/Out/2025/FPRD/APPOINTMENT%20AND%20ANNOUNCEMENT%20OF%20SUCCESSOR%20TO%20MD.pdf
```

### 5. **Fetch PDF by Circular ID**
```
Now try fetching the PDF document using just the circular ID (7864) instead of the direct URL. This should automatically find and download the associated PDF.
```

### 6. **Category-based Analysis**
```
Get me all circulars from 2025 that contain keywords related to "FPRD" (Financial Policy & Regulation Department). Limit to 10 results.
```

### 7. **Server Status Check**
```
Check the current status of the CBN API connection and give me information about this MCP server.
```

### 8. **Generate Analysis Prompt**
```
Create a regulatory analysis prompt for the circulars we've found, focusing on compliance requirements for commercial banks.
```

## 🔍 Expected Outcomes

After running these tests, you should be able to:

- ✅ Retrieve and display CBN circular metadata
- ✅ Search circulars by keywords  
- ✅ Fetch individual circular details
- ✅ Download PDF documents from URLs
- ✅ Download PDFs using circular IDs
- ✅ Filter circulars by date and category
- ✅ Check server health and status
- ✅ Generate compliance analysis prompts

## 🚀 Advanced Test Scenarios

### Test Error Handling
```
Try fetching a PDF from an invalid URL to test error handling:
https://www.cbn.gov.ng/invalid/path/test.pdf
```

### Test Large Date Range
```
Get all circulars from January 1, 2024 to December 31, 2024, limited to 20 results.
```

### Test Empty Search
```
Search for circulars with the term "nonexistentterm12345" to test empty result handling.
```

## 📊 Success Criteria

The MCP server passes all tests if:

1. **Data Retrieval**: Successfully fetches and parses circular data from CBN API
2. **PDF Download**: Can download PDF documents and report correct file sizes
3. **Search Functionality**: Returns relevant results for keyword searches
4. **Error Handling**: Gracefully handles invalid URLs and missing data
5. **Performance**: Responds within reasonable time limits
6. **Data Integrity**: Returns accurate and complete circular information

## 🎉 Bonus Points

Try these creative use cases:

- Ask for a summary of all payment-related regulations from the last 6 months
- Request a comparison between different circular types (BSD vs FPRD vs CCD)
- Generate a compliance checklist based on recent circulars
- Create a timeline of regulatory changes in 2025

---

**Note**: This MCP server provides real-time access to CBN circulars and their PDF documents. All data is fetched directly from the official CBN API at `https://www.cbn.gov.ng/api/GetAllCirculars?format=json`.
