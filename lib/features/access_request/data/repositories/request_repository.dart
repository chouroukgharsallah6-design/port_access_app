import 'package:cloud_firestore/cloud_firestore.dart';

class RequestRepository {

  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Future<void> createRequest(
      Map<String, dynamic> data) async {

    await _firestore
        .collection("requests")
        .add(data);
  }

  Stream<QuerySnapshot> getRequests() {

    return _firestore
        .collection("requests")
        .snapshots();
  }
}