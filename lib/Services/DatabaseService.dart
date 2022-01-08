import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upwork/firebaseApp.dart';

class DatabaseService {
  Future<void> addDocument(String collectionName, data) {
    CollectionReference collection = database.collection(collectionName);
    return collection
        .add(data)
        .then((res) => print("Document Added: $res"))
        .catchError((error) => print("Failed to add Document: $error"));
  }

  Future<void> updateDocument(String collectionName, docID, data) {
    CollectionReference collection = database.collection(collectionName);
    return collection
        .doc(docID)
        .update(data)
        .then((res) => print("Document Updated"))
        .catchError((error) => print("Failed to update Document: $error"));
  }

  Future<void> addSubCollectionDocument(collectionName, subCollectionName, docID, data) {
    CollectionReference collection = database.collection(collectionName);

    return collection
        .doc(docID)
        .collection(subCollectionName)
        .add(data)
        .then((res) => print("Document Updated"))
        .catchError((error) => print("Failed to update Document: $error"));
  }


  Future<void> deleteDocument(String collectionName, docID) {
    CollectionReference collection = database.collection(collectionName);
    return collection
        .doc(docID)
        .delete()
        .then((res) => print("Document Updated"))
        .catchError((error) => print("Failed to update Document: $error"));
  }
}
