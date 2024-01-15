import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lab4_app/models/fav.dart';
import 'package:lab4_app/models/users.dart';

class FirebaseAccount {
  final CollectionReference user =
  FirebaseFirestore.instance.collection("user");

  Future<UserModel> getUser(String userId) async {
    try {
      DocumentSnapshot data = await user.doc(userId).get();
      if (data.exists) {
        print("hahahaha ${UserModel.fromFirestore(data)}");
        return UserModel.fromFirestore(data);
      } else {
        throw Exception('Người dùng không tồn tại');
      }
    } catch (e) {
      throw (e);
    }
  }

  final CollectionReference store =
  FirebaseFirestore.instance.collection("favorite");

  Future<String> getData(String id) async {
    try {
      DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection("user").doc(id).get();
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return jsonEncode(data);
    } catch (e) {
      throw (e);
    }
  }

  Future<void> addFavourite(String productId, String userId) async {
    try {
      await store
          .doc(productId)
          .set({"productId": productId, "userId": userId});
    } catch (e) {
      throw (e);
    }
  }

  Future<List<Fav>> getTym(String userId) async {
    try {
      QuerySnapshot<
          Map<String, dynamic>> querySnapshot = await FirebaseFirestore
          .instance
          .collection('favorite')
          .where("userId", isEqualTo: userId)
          .get();

      List<Fav> favList = [];
      List<
          QueryDocumentSnapshot<Map<String, dynamic>>> documents = querySnapshot
          .docs;

      for (var document in documents) {
        favList.add(Fav.fromDocument(document));
      }

      return favList;
    } catch (e) {
      print("Error fetching data: $e");
      throw Exception(e);
    }
  }
  Future<void> deleteLoveData(String id) async {
    try {
      await store.doc(id).delete();
      print("Love data deleted successfully");
    } catch (e) {
      throw("Error deleting love data: $e");
    }
  }
}

