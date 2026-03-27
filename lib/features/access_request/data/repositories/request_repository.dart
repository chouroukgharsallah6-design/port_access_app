import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/request_model.dart';

class RequestRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createRequest(Map<String, dynamic> data) async {
    await _firestore.collection("requests").add(data);
  }

  Future<void> updateRequestStatus({
    required String id,
    required String status,
  }) async {
    await _firestore.collection("requests").doc(id).update({
      "status": status,
    });
  }

  Stream<List<RequestModel>> getRequests() {
    return _firestore.collection("requests").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return RequestModel.fromMap(data, doc.id);
      }).toList();
    });
  }
}
