
class Contact {
  int id;
  String name;
  String lastName;
  bool isOnline;
  String imageUrl;
  DateTime lastOnlineTime;

  Contact({
    required this.id,
    required this.name,
    required this.lastName,
    required this.imageUrl,
    required this.isOnline,
    required this.lastOnlineTime,
  });
}