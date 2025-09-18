/// Service for generating CBN-related prompts
class CBNPromptService {
  /// Generate a summary prompt for CBN circulars analysis
  String circularSummaryPrompt({
    required String circularData,
    String summaryType = 'general',
  }) {
    return '''Please analyze the following CBN circular data and provide a $summaryType summary:

Circular Data:
$circularData

Please provide:
1. Key highlights and main points
2. Regulatory implications
3. Impact on financial institutions
4. Compliance requirements (if any)
5. Effective dates and deadlines
6. Relevant stakeholders affected

Focus on making the summary clear and actionable for financial professionals and institutions.''';
  }

  /// Generate prompts for regulatory compliance analysis of CBN circulars
  String regulatoryAnalysisPrompt({
    required String circulars,
    String institutionType = 'financial institution',
  }) {
    return '''As a regulatory compliance expert, analyze the following CBN circulars for a $institutionType:

Circulars:
$circulars

Please provide:
1. Compliance checklist for this $institutionType
2. Implementation timeline and key deadlines
3. Required policy updates or new policies needed
4. Staff training requirements
5. System/process changes required
6. Reporting obligations
7. Penalties for non-compliance
8. Recommended next steps

Structure your analysis to be immediately actionable for compliance teams.''';
  }
}
