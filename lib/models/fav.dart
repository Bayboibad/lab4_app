import 'package:cloud_firestore/cloud_firestore.dart';

class Fav {
  final String documentId;
  final Map<String, dynamic> data;

  Fav({required this.documentId, required this.data});

  factory Fav.fromDocument(QueryDocumentSnapshot<Map<String, dynamic>> document) {
    return Fav(
      documentId: document.id,
      data: document.data(),
    );
  }

  int get proId => int.parse(data['productId'].toString());
}
