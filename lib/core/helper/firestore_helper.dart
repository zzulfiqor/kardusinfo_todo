import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  final _client = FirebaseFirestore.instance;

  // get collection
  CollectionReference getCollection(String path) {
    return _client.collection(path);
  }

  // get document in collection
  


}
