import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/Login.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/SignupDetails.dart';
import 'package:upwork/View/components/Shared/Roundedinput.dart';
import 'package:upwork/View/components/Shared/or_divider.dart';
import 'package:upwork/View/components/beforeLogin/Loginbtn.dart';
import 'package:upwork/View/components/beforeLogin/googleBtn.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String err="Oops! Email is incorrect";
  bool valid=false;
  @override
  Widget build(BuildContext context) {
    String emailVal;
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SvgPicture.asset(
                "assets/svg/upwork.svg",
                width: 200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Get your free account",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Serif',
                    fontWeight: FontWeight.w500),
              ),
            ),
            GoogleSignInButton(),
            OrDivider(
              text: "or",
            ),
           
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Container(
            //     child: Text(
            //       "*Should be left",
            //       style: TextStyle(color: Colors.red),
            //     ),
            //   ),
            // ),
            RoundedInputField(
              validate: true,
              textInputType: TextInputType.emailAddress,
              icon: Icons.email,
              err: "Oops! Email is incorrect",
              hintText: "work email address",
              onChanged: (value) {
                emailVal = value;
                print(emailVal);
              },
            ),
            RoundedButton(
              color: Color(0XFF37a000),
              text: "Continue with Email",
              textColor: Colors.white,
              borderColor: Color(0x00000000),
              press: () {
                // print(widget.emailVal);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SignupDetails(
                      emailVal: emailVal,
                    );
                  }
                ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(
                color: Colors.grey,
                thickness: 0.2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage(
                            // emailVal: widget.emailVal,
                            );
                      }));
                      // Navigator.pushNamed(context,
                      //     "package:upwork/View/Pages/BeforeLoginPages/Login.dart");
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          color: Color(0XFF37a000),
                          fontWeight: FontWeight.w600),
                    )),
              ],
            )
          ],
        ),
      )),
    ));
  }
}
