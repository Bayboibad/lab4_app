import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String username;
  final String email;
  final bool favourite;
  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.favourite,
  });
  @override
  String toString() {
    return 'User{id: $id, username: $username, email: $email, favourite: $favourite,}';
  }

  factory UserModel.fromFirestore(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return UserModel(
      id: document.id,
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      favourite: data['favourite'] ?? '',
    );
  }
}
