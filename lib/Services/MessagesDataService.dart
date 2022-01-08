import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upwork/Models/messages.dart';
import 'package:upwork/firebaseApp.dart';
import 'authService.dart';

class MessagesDataService {
  Future<MessagesDataModel> getMessageData() async {
    MessagesDataModel message;
    try {
      String uid =
          await AuthService().getCurrentUserUid().then((value) => value);
      await database
          .collection('messages')
          .where("talentAuthID,", isEqualTo: uid)
          .get()
          .then((QuerySnapshot res) {
        message = MessagesDataModel.fromJson(res.docs[0].data());
      });
    } catch (e) {
      print(e);
    }
    return message;
  }

  Future<List<MessagesDataModel>> getMessagesData() async {
    List<MessagesDataModel> messages = [];
    try {
      await database.collection('messages').get().then((QuerySnapshot res) {
        res.docs.forEach((doc) {
          messages.add(MessagesDataModel.fromJson(doc.data()));
        });
      });
    } catch (e) {
      print(e);
    }
    return messages;
  }
}
