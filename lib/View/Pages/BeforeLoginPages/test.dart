// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import 'package:path/path.dart';
// void main() {
//   runApp(MaterialApp(
//     title: 'Firebase Storage Demo',
//     theme: ThemeData(
//       primarySwatch: Colors.blue,
//     ),
//     home: UploadingImageToFirebaseStorage(),
//   ));
// }

// final Color green = Colors.brown;
// final Color orange = Colors.brown;

// class UploadingImageToFirebaseStorage extends StatefulWidget {
//   @override
//   _UploadingImageToFirebaseStorageState createState() =>
//       _UploadingImageToFirebaseStorageState();
// }

// class _UploadingImageToFirebaseStorageState
//     extends State<UploadingImageToFirebaseStorage> {
//   File _imageFile;

//   ///NOTE: Only supported on Android & iOS
//   ///Needs image_picker plugin {https://pub.dev/packages/image_picker}
//   final picker = ImagePicker();

//   Future pickImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.camera);

//     setState(() {
//       _imageFile = File(pickedFile.path);
//     });
//   }

// //  Future uploadFile() async {    
// //    StorageReference storageReference = FirebaseStorage.instance    
// //        .ref()    
// //        .child('chats/${Path.basename(_image.path)}}');    
// //    StorageUploadTask uploadTask = storageReference.putFile(_image);    
// //    await uploadTask.onComplete;    
// //    print('File Uploaded');    
// //    storageReference.getDownloadURL().then((fileURL) {    
// //      setState(() {    
// //        _uploadedFileURL = fileURL;    
// //      });    
// //    });    
// //  } 

// FirebaseStorage storage = FirebaseStorage.instance;
// Reference ref = storage.ref().child("image1" + DateTime.now().toString());
// UploadTask uploadTask = ref.putFile(_image1);
// uploadTask.then((res) {
//    res.ref.getDownloadURL();
// });
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: 360,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(250.0),
//                     bottomRight: Radius.circular(10.0)),
//                 gradient: LinearGradient(
//                     colors: [green,orange],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight)),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 80),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Center(
//                     child: Text(
//                       "Uploading Image to Firebase Storage",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 28,
//                           fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 Expanded(
//                   child: Stack(
//                     children: <Widget>[
//                       Container(
//                         height: double.infinity,
//                         margin: const EdgeInsets.only(
//                             left: 30.0, right: 30.0, top: 10.0),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(30.0),
//                           child: _imageFile != null
//                               ? Image.file(_imageFile)
//                               : FlatButton(
//                             child: Icon(
//                               Icons.add_a_photo,
//                               color: Colors.blue,
//                               size: 50,
//                             ),
//                             onPressed: pickImage,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 uploadImageButton(context),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget uploadImageButton(BuildContext context) {
//     return Container(
//       child: Stack(
//         children: <Widget>[
//           Container(
//             padding:
//             const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
//             margin: const EdgeInsets.only(
//                 top: 30, left: 20.0, right: 20.0, bottom: 20.0),
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [orange, green],
//                 ),
//                 borderRadius: BorderRadius.circular(30.0)),
//             child: FlatButton(
//               onPressed: () => uploadImageToFirebase(context),
//               child: Text(
//                 "Upload Image",
//                 style: TextStyle(fontSize: 20,color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// /*
// if request.auth != null*/   