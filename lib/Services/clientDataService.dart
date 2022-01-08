import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upwork/Models/clientData.Dart';

class ClientDataService {
  Future<ClientDataModel> getClientData(id) async {
    ClientDataModel client;
    try {
      await FirebaseFirestore.instance
          .collection('client')
          .doc(id)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          print('Document exists on the database client');
          client = ClientDataModel.fromJson(documentSnapshot.data());
        }
      });
    } catch (e) {
      print(e);
    }
    return client;
  }
}
