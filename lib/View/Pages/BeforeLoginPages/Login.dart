import 'package:flutter/material.dart';
import 'package:upwork/View/components/beforeLogin/LoginBody.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:LoginBody() ,
      
    );
  }
}