import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/Password.dart';
import 'package:upwork/View/components/Shared/BackGround.dart';
import 'package:upwork/View/components/Shared/Roundedinput.dart';
import 'package:upwork/View/components/Shared/or_divider.dart';
import 'package:upwork/View/components/beforeLogin/googleBtn.dart';
import 'Loginbtn.dart';

// ignore: must_be_immutable
class LoginBody extends StatefulWidget {
  String emailVal;
  LoginBody({this.emailVal});
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/svg/upwork.svg",
              height: size.height * 0.13,
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Log in to upwork",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              textInputType: TextInputType.emailAddress,
              icon: Icons.person,
              err: "Oops! Email is incorrect",
              hintText: "Username or Email",
              onChanged: (value) {
                widget.emailVal = value;
              },
            ),
            RoundedButton(
              color: Color(0XFF37a000),
              text: "Continue with Email",
              textColor: Colors.white,
              borderColor: Color(0x00000000),
              press: () {
                print(widget.emailVal);
                if (widget.emailVal != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return PasswordPage(
                        emailVal: widget.emailVal,
                      );
                    }),
                  );
                }
              },
            ),
            OrDivider(
              text: "or",
            ),
            GoogleSignInButton(),
            RoundedButton(
              text: "Continue with Apple",
              color: Colors.white,
              textColor: Colors.black,
              press: () => {},
              borderColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
