import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String profileImageUrl;

  UserModel(
      {required this.id, required this.name, required this.profileImageUrl});

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return UserModel(
      id: doc.id,
      name: doc[
          'name'], // Replace 'name' with the actual field name in your Firestore
      profileImageUrl: doc[
          'profileImageUrl'], // Replace 'profileImageUrl' with the actual field
    );
  }

  static fromFirestore(QueryDocumentSnapshot<Object?> doc) {}
}
