import 'package:flutter/material.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Color(0xff3578E7),
                borderRadius: BorderRadius.circular(30),
              ),
              // child: OutlinedButton(
              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all(Color(0xff4285F4)),
              //   shape: MaterialStateProperty.all(
              //     RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(4),
              //     ),
              //   ),
              // ),
              // onPressed: () => {},
              // onPressed: () async {
              //   setState(() {
              //     _isSigningIn = true;
              //   });
              //   User? user =
              //       await Authentication.signInWithGoogle(context: context);

              //   setState(() {
              //     _isSigningIn = false;
              //   });

              //   if (user != null) {
              //     Navigator.of(context).pushReplacement(
              //       MaterialPageRoute(
              //         builder: (context) => UserInfoScreen(
              //           user: user,
              //         ),
              //       ),
              //     );
              //   }
              // },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image(
                            image: AssetImage("assets/img/google_logo.png"),
                            height: 16.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: Text(
                          'Continue with Google',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // ),
            ),
    );
  }
}
