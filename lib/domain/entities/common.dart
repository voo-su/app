class Receiver {
  final int chatType;
  final int receiverId;

  Receiver({required this.chatType, required this.receiverId});
}

class InputFile {
  final int id;
  final int parts;
  final String name;

  InputFile({required this.id, required this.parts, required this.name});
}
