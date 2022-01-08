import 'package:flutter/material.dart';
import 'package:upwork/Services/DatabaseService.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/CreateProfile.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/Phone.dart';
import 'package:upwork/View/components/Shared/CustomDrawer.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:upwork/firebaseApp.dart';

class Location extends StatefulWidget {
  String zip;
  String addressstree;
  String city;
  String state;
  String country;

  Location({this.zip, this.addressstree, this.city, this.state, this.country});
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  bool _validate = false;
  bool _validate2 = false;
  bool _validate4 = false;
  final _text = TextEditingController();
  final _text2 = TextEditingController();
  final _text4 = TextEditingController();

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
                  icon: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        ExactAssetImage("assets/img/default-avatar.jpg"),
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              title: Center(
                child: Text(
                  "Create Profile",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              actions: [
                CustomMenuButton(),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                  child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(children: <Widget>[
                              Row(children: <Widget>[
                                Text(
                                  'Where are you based?',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ]),
                              SizedBox(height: size.height * 0.01),
                              Text(
                                'We take your privacy very seriously. Only your city and country will be shown to clients.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ])),
                        SizedBox(height: size.height * 0.03),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Country',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                      child: CountryListPick(
                                    theme: CountryTheme(
                                      isShowFlag: true,
                                      isShowTitle: true,
                                      isShowCode: false,
                                      isDownIcon: true,
                                      showEnglishName: true,
                                    ),
                                    initialSelection: '+62',
                                    onChanged: (CountryCode code) {
                                      widget.country = code.name;
                                    },
                                  ))),
                            ]),
                        SizedBox(height: size.height * 0.03),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Street Address',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(children: <Widget>[
                            TextField(
                              controller: _text,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Color(0xff6D6D6D),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0XFF0F8E0F), width: 2.0),
                                ),
                                errorText:
                                    _validate ? 'This field is required' : null,
                              ),
                              onChanged: (value) {
                                widget.addressstree = value;
                                print(widget.addressstree);
                              },
                            ),
                          ]),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'City',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ]),
                        Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(children: <Widget>[
                              TextField(
                                controller: _text2,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Color(0xff6D6D6D),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0XFF0F8E0F), width: 2.0),
                                  ),
                                  errorText: _validate2
                                      ? 'This field is required'
                                      : null,
                                  hintText: 'Start typing your City',
                                  prefixIcon: Icon(Icons.search),
                                ),
                                onChanged: (value) {
                                  widget.city = value;
                                  print(widget.city);
                                },
                              ),
                            ])),
                        SizedBox(height: size.height * 0.03),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'State/Province',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(children: <Widget>[
                            TextField(
                              controller: _text4,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Color(0xff6D6D6D),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0XFF0F8E0F), width: 2.0),
                                ),
                                errorText: _validate4
                                    ? 'This field is required'
                                    : null,
                              ),
                              onChanged: (value) {
                                widget.state = value;
                                print(widget.state);
                              },
                            ),
                          ]),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'zip/Postal code',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ]),
                        Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(children: <Widget>[
                              TextField(
                                // controller: _text3,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Color(0xff6D6D6D),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0XFF0F8E0F), width: 2.0),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  widget.zip = value;
                                  print(widget.zip);
                                },
                              ),
                              SizedBox(height: size.height * 0.03),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      height: size.height * 0.07,
                                      width: size.width * 0.4,
                                      margin: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: FlatButton(
                                        color: Colors.white,
                                        onPressed: () => {},
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Text(
                                          "Back",
                                          style: TextStyle(
                                            color: Color(0xFF15A800),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: size.height * 0.07,
                                      width: size.width * 0.4,
                                      margin: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF15A800)),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: FlatButton(
                                        color: Color(0xFF15A800),
                                        onPressed: () {
                                          setState(() {
                                            _text.text.isEmpty
                                                ? _validate = true
                                                : _validate = false;
                                          });

                                          setState(() {
                                            _text2.text.isEmpty
                                                ? _validate2 = true
                                                : _validate2 = false;
                                          });
                                          DatabaseService().updateDocument(
                                              "talent", auth.currentUser.uid, {
                                            'location': {
                                              'city': widget.city,
                                              'country': widget.country,
                                              'street': widget.addressstree,
                                              'zip': widget.zip,
                                            }
                                          });

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return Phone();
                                              },
                                            ),
                                          );
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Text(
                                          "Next",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ]))
                      ]),
                ),
              )),
            )));
  }
}
