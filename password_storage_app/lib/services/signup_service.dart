import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:password_storage_app/models/user.dart';

class SignUpService {
  Firestore _db = Firestore.instance;

  Future<void> signUpUser(User user) {
    return _db.collection('users').add(
      user.toMap()
    );
  }
}