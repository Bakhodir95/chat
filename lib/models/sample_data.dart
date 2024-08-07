// lib/sample_data.dart
import 'package:lesson92/models/contact.dart';
import 'package:lesson92/models/message.dart';

// Sample contacts
final List<Contact> sampleContacts = [
  Contact(
    id: 1,
    name: 'Alice',
    lastName: 'Johnson',
    isOnline: true,
    imageUrl: 'https://via.placeholder.com/150/1f3c88', // Placeholder image URL
    lastOnlineTime: DateTime.now().subtract(Duration(minutes: 5)),
  ),
  Contact(
    id: 2,
    name: 'Bob',
    lastName: 'Williams',
    isOnline: false,
    imageUrl: 'https://via.placeholder.com/150/ff6347',
    lastOnlineTime: DateTime.now().subtract(Duration(minutes: 20)),
  ),
  Contact(
    id: 3,
    name: 'Charlie',
    lastName: 'Brown',
    isOnline: true,
    imageUrl: 'https://via.placeholder.com/150/4682b4',
    lastOnlineTime: DateTime.now().subtract(Duration(minutes: 10)),
  ),
  Contact(
    id: 4,
    name: 'David',
    lastName: 'Smith',
    isOnline: false,
    imageUrl: 'https://via.placeholder.com/150/ffeb3b',
    lastOnlineTime: DateTime.now().subtract(Duration(hours: 1)),
  ),
];

// Sample messages
final List<Message> sampleMessages = [
  Message(
    id: 1,
    text: 'Hey, how are you?',
    contactId: 1,
    createdTime: DateTime.now().subtract(Duration(minutes: 1)),
    isFile: false,
    status: 1,
  ),
  Message(
    id: 2,
    text: 'Can you send me the file?',
    contactId: 1,
    createdTime: DateTime.now().subtract(Duration(minutes: 2)),
    isFile: false,
    status: 1,
  ),
  Message(
    id: 3,
    text: 'Here is the document you requested.',
    contactId: 1,
    createdTime: DateTime.now().subtract(Duration(minutes: 3)),
    isFile: true,
    status: 1,
  ),
  Message(
    id: 4,
    text: 'Lunch at 1?',
    contactId: 2,
    createdTime: DateTime.now().subtract(Duration(minutes: 15)),
    isFile: false,
    status: 1,
  ),
  Message(
    id: 5,
    text: 'Let\'s catch up later!',
    contactId: 3,
    createdTime: DateTime.now().subtract(Duration(minutes: 30)),
    isFile: false,
    status: 1,
  ),
  Message(
    id: 6,
    text: 'Check out this cool link: http://example.com',
    contactId: 4,
    createdTime: DateTime.now().subtract(Duration(hours: 1)),
    isFile: true,
    status: 1,
  ),
];
