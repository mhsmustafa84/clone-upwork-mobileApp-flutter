import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:upwork/View/components/Shared/BackGround.dart';
import 'package:upwork/View/Pages/TalentPages/HomePage.dart';
import 'package:upwork/View/components/Shared/Roundedinput.dart';
import 'package:upwork/View/components/beforeLogin/Loginbtn.dart';
import 'package:upwork/constanse.dart';
import 'package:upwork/Services/authService.dart';

class PasswordPage extends StatefulWidget {
  final String emailVal;
  PasswordPage({this.emailVal});
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  String passVal;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/svg/login.svg",
              height: size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
            ),
            SizedBox(height: size.height * 0.03),
            if (widget.emailVal != null)
              Text(
                widget.emailVal,
                style: TextStyle(fontSize: 15,fontWeight:FontWeight.w500,color: bgUpworkDark ),
              ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              passInput: true,
              icon: Icons.lock,
              err: "Oops! Password is incorrect",
              hintText: "Password",
              onChanged: (value) {
                passVal = value;
              },
            ),
            RoundedButton(
              color: Color(0XFF37a000),
              text: "Log in",
              textColor: Colors.white,
              borderColor: Color(0x00000000),
              press: () async {
                bool isLogin =
                    await AuthService().signIn(widget.emailVal, passVal);
                isLogin
                    ? Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }))
                    : Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                        return PasswordPage(emailVal: 'Email is not in use.. Go to Signup',);
                      }));
                // if (isLogin) {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) {return HomePage();}));
                // }
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    child: new Text(
                      'Forget password ?',
                      style: TextStyle(
                          color: bgUpwork, fontWeight: FontWeight.bold),
                    ),
                    onTap: () => {}),
                InkWell(
                    child: new Text(
                      'Not you?',
                      style: TextStyle(
                          color: bgUpwork, fontWeight: FontWeight.bold),
                    ),
                    onTap: () => {}),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
