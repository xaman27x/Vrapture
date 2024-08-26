import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vrapture/models/auth.dart';

class Firestore {
  static Future<void> uploadData({
    required String name,
    required String age,
    required String email,
  }) async {
    try {
      final int intAge = int.parse(age);

      final userId = Auth().currUser?.uid;
      if (userId == null) {
        throw Exception("User is not logged in");
      }

      final Map<String, dynamic> payload = {
        'Name': name,
        'Age': intAge,
        'UserID': userId,
        'EmailID': email,
      };

      await FirebaseFirestore.instance.collection('Users').add(payload);
    } catch (e) {
      throw Exception("Failed to upload data: $e");
    }
  }

  static Future<String> retrieveName() async {
    try {
      final userId = Auth().currUser?.uid;
      if (userId == null) {
        throw Exception("User is not logged in");
      }

      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('UserID', isEqualTo: userId)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return '';
      }
      return querySnapshot.docs.first['Name'];
    } catch (e) {
      throw Exception("Failed to retrieve name: $e");
    }
  }
}
