import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  final FlutterTts _flutterTts = FlutterTts();
  bool _isSpeaking = false;
  bool _isInitialized = false;

  TTSService() {
    _initTTS();
  }

  Future<void> _initTTS() async {
    try {
      // Check available languages
      var languages = await _flutterTts.getLanguages;
      print("Available languages: $languages");
      
      // Set configuration
      await _flutterTts.setLanguage("en-US");
      await _flutterTts.setSpeechRate(0.5);
      await _flutterTts.setVolume(1.0);
      await _flutterTts.setPitch(1.0);
      
      // Set completion handler
      _flutterTts.setCompletionHandler(() {
        _isSpeaking = false;
      });
      
      // Set error handler
      _flutterTts.setErrorHandler((error) {
        print("TTS Error: $error");
        _isSpeaking = false;
      });
      
      _isInitialized = true;
      print("TTS initialized successfully");
    } catch (e) {
      print("TTS initialization error: $e");
      _isInitialized = false;
    }
  }

  Future<void> speak(String text) async {
    if (text.isEmpty) return;
    
    if (!_isInitialized) {
      print("TTS not initialized, trying to initialize again");
      await _initTTS();
    }
    
    if (_isSpeaking) {
      await _flutterTts.stop();
    }
    
    try {
      print("TTS attempting to speak: ${text.substring(0, text.length > 20 ? 20 : text.length)}...");
      
      // For long responses, split into smaller chunks to prevent TTS issues
      if (text.length > 1000) {
        // Split by sentences or paragraphs
        var sentences = text.split(RegExp(r'(?<=[.!?])\s+'));
        for (var sentence in sentences) {
          _isSpeaking = true;
          await _flutterTts.speak(sentence);
          // Wait a bit between sentences
          await Future.delayed(Duration(milliseconds: 500));
        }
      } else {
        _isSpeaking = true;
        var result = await _flutterTts.speak(text);
        print("TTS speak result: $result");
      }
    } catch (e) {
      print("TTS speak error: $e");
      _isSpeaking = false;
    }
  }

  Future<void> stop() async {
    try {
      await _flutterTts.stop();
      _isSpeaking = false;
    } catch (e) {
      print("TTS stop error: $e");
    }
  }

  void dispose() {
    _flutterTts.stop();
  }

  bool get isSpeaking => _isSpeaking;
}