import 'package:flutter/material.dart';
import 'package:upwork/Models/UserData.dart';
import 'package:upwork/Services/UserDataService.dart';

class CustomCircleAvatar extends StatefulWidget {
  @override
  _CustomCircleAvatarState createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  UserDataModel user;

  getData() async {
    user = await UserDataService().getUserData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: user?.profilePhoto != null
          ? NetworkImage(user.profilePhoto)
          : ExactAssetImage("assets/img/default-avatar.jpg"),
    );
  }
}
