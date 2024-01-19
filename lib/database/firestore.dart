import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(
      String username,
      String firstName,
      String lastName,
      int dayOfBirth,
      int monthOfBirth,
      int yearOfBirth,
      String email,
      String password) {
    return users.add({
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'day_of_birth': dayOfBirth,
      'month_of_birth': monthOfBirth,
      'year_of_birth': yearOfBirth,
      'email': email,
      'password': password,
    });
  }
}
