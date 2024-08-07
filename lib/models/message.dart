class Message {
  int id;
  String text;
  bool isFile;
  DateTime createdTime;
  int contactId;
  int status;

  Message({
    required this.id,
    required this.text,
    required this.contactId,
    required this.createdTime,
    required this.isFile,
    required this.status,
  });
}