import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final GenerativeModel? _model;

  GeminiService() : _model = _initModel();

  static GenerativeModel? _initModel() {
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      return null;
    }
    
    return GenerativeModel(
      model: 'gemini-2.0-flash',
      apiKey: apiKey,
    );
  }

  Future<String> generateResponse(String prompt) async {
    if (_model == null) {
      throw Exception('Gemini API key not found or invalid');
    }

    try {
      final response = await _model!.generateContent([
        Content.text(prompt),
      ]);

      if (response.candidates.isEmpty || 
          response.candidates.first.content.parts.isEmpty) {
        return "I'm sorry, I couldn't generate a response.";
      }

      String responseText = "";
      for (final part in response.candidates.first.content.parts) {
        if (part is TextPart) {
          responseText += part.text;
        }
      }
      
      return responseText.isNotEmpty 
          ? responseText 
          : "I received a response but couldn't format it properly.";
    } catch (e) {
      // Better error handling with more specific message
      return "Sorry, I encountered an issue: ${e.toString().split(":").first}. Please try a different question.";
    }
  }
}