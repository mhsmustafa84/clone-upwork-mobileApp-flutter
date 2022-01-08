import 'package:flutter/material.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/Login.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/Signup.dart';
import 'package:upwork/View/components/beforeLogin/Loginbtn.dart';
import 'package:upwork/constanse.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgUpworkDark,
      body: Container(
          width: 500,
          height: 650,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/1.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: RoundedButton(
                  borderColor: Color(0x00000000),
                  text: "Login",
                  textColor: Colors.white,
                  color: bgUpwork,
                  press: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    )
                  },
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                  child: new Text(
                    'New to Upwork ? Sign Up',
                    style:
                        TextStyle(color: bgUpwork, fontWeight: FontWeight.bold),
                  ),
                  onTap: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Signup(
                              // emailVal: widget.emailVal,
                              );
                        }))
                      }),
            ],
          )),
    );
  }
}
