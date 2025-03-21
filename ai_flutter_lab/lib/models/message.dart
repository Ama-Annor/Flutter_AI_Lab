enum MessageType {
  user,
  bot,
}

class Message {
  final String content;
  final MessageType type;
  final DateTime timestamp;

  Message({
    required this.content,
    required this.type,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}