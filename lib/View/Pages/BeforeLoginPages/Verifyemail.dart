import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/CreateProfile.dart';
import 'package:upwork/View/components/Shared/CustomCircleAvatar.dart';
import 'package:upwork/View/components/Shared/CustomDrawer.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';
import 'package:upwork/View/components/beforeLogin/Loginbtn.dart';

class Verifyemail extends StatefulWidget {
  final String emailVal;

  Verifyemail({this.emailVal});
  @override
  _VerifyemailState createState() => _VerifyemailState();
}

class _VerifyemailState extends State<Verifyemail> {
  @override
 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              leading: Builder(
                builder: (context) => IconButton(
                  icon: CustomCircleAvatar(),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              title: Center(
                child: Text(
                  "Verify email",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              actions: [
                CustomMenuButton(),
              ],
            ),
            body: SingleChildScrollView(
                child: Center(
                    child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SvgPicture.asset(
                  "assets/svg/verifyemail.svg",
                  width: 150,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Verify your email to proceed',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'we just sent an email to the address ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  widget.emailVal,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Column(children: <Widget>[
                    Text(
                      'Please check your email and click on the line ',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      ' provided to verify your address ',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ])),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: RoundedButton(
                  color: Color(0XFF37a000),
                  text: "Continue",
                  textColor: Colors.white,
                  borderColor: Color(0x00000000),
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Createprofile();
                      }),
                    );
                  },
                ),
              )
            ])))));
  }
}
