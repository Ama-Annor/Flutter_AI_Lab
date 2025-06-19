# Flutter AI Chatbot

A modern Flutter mobile application that integrates Google's Gemini 2.0 Flash AI model to create an intelligent chatbot with text-to-speech capabilities.

## Features

- **AI-Powered Conversations**: Leverages Google's Gemini 2.0 Flash model for intelligent responses
- **Text-to-Speech**: Built-in voice output using Flutter TTS
- **Clean UI**: Material Design interface with deep purple theme
- **Error Handling**: Robust error management for API calls and TTS functionality
- **Environment Configuration**: Secure API key management using dotenv

## Screenshots

*Add your app screenshots here*

## Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Google Gemini API key
- Android Studio or VS Code with Flutter extensions
- Physical device or emulator for testing

## Setup and Installation

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/flutter-ai-chatbot.git
cd flutter-ai-chatbot
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Environment Setup
Create a `.env` file in the root directory:
```env
GEMINI_API_KEY=your_gemini_api_key_here
```

**To get your Gemini API key:**
1. Visit [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Create a new API key
3. Copy and paste it into your `.env` file

### 4. Run the Application
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                 # App entry point and configuration
├── screens/
│   └── chat_screen.dart     # Main chat interface
└── services/
    ├── gemini_service.dart  # Google Gemini AI integration
    └── tts_service.dart     # Text-to-speech functionality
```

## Dependencies

- `flutter/material.dart` - Material Design components
- `flutter_dotenv` - Environment variable management
- `google_generative_ai` - Google Gemini AI integration
- `flutter_tts` - Text-to-speech functionality

## Key Components

### GeminiService
- Handles communication with Google's Gemini 2.0 Flash API
- Manages API key authentication
- Processes AI responses with error handling

### TTSService
- Converts AI responses to speech
- Configurable speech rate, volume, and pitch
- Handles long text by splitting into manageable chunks

## Usage

1. Launch the app
2. Type your message in the chat interface
3. Receive AI-generated responses
4. Listen to responses with built-in text-to-speech
5. Continue the conversation naturally

## Configuration Options

### Text-to-Speech Settings
```dart
await _flutterTts.setLanguage("en-US");
await _flutterTts.setSpeechRate(0.5);    // Adjust speech speed
await _flutterTts.setVolume(1.0);        // Adjust volume
await _flutterTts.setPitch(1.0);         // Adjust pitch
```

## Troubleshooting

### Common Issues

**API Key Issues:**
- Ensure your `.env` file is in the root directory
- Verify your Gemini API key is valid and active
- Check that the API key has proper permissions

**TTS Not Working:**
- Test on a physical device (TTS may not work on some emulators)
- Check device volume settings
- Ensure the app has audio permissions

**Build Errors:**
```bash
flutter clean
flutter pub get
flutter run
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Google Gemini AI for powerful language model capabilities
- Flutter team for the excellent framework
- Flutter TTS plugin developers

## Future Enhancements

- [ ] Chat history persistence
- [ ] Multiple conversation threads
- [ ] Voice input functionality
- [ ] Custom themes and personalization
- [ ] Message export functionality
- [ ] Offline mode capabilities

## Support

If you encounter any issues or have questions, please:
1. Check the troubleshooting section above
2. Search existing [Issues](link-to-issues)
3. Create a new issue with detailed information

---

**Made using Flutter and Google Gemini AI**
