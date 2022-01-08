import 'package:flutter/material.dart';
import 'package:upwork/Services/DatabaseService.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/LanguageProficiency.dart';
import 'package:upwork/View/components/Shared/CustomDrawer.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';
import 'package:upwork/View/components/Talent/SelectDropDown.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:upwork/firebaseApp.dart';

class EmployementDetails extends StatefulWidget {
  String company;
  String location;
  String title;
  String description;

  EmployementDetails({
    this.company,
    this.location,
    this.description,
    this.title,
  });
  @override
  _EmployementDetailsState createState() => _EmployementDetailsState();
}

class _EmployementDetailsState extends State<EmployementDetails> {
  String dropdownValue2, dropdownValue, dropdownValue3, dropdownValue4;
  bool valuesecond = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: Center(
              child: Text(
                "Add Employment",
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              CustomMenuButton(),
            ],
          ),
          body: SingleChildScrollView(
              child: Column(children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Company',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ]),
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0.05),
                          height: size.height * 0.07,
                          width: size.width * 0.9,
                          child: TextField(
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
                            onChanged: (value) {
                              widget.company = value;
                              print(widget.company);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Location',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ]),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Column(children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0.05),
                              height: size.height * 0.07,
                              width: size.width * 0.9,
                              child: TextField(
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
                                  hintText: "City",
                                ),
                                onChanged: (value) {
                                  widget.location = value;
                                  //print(widget.location);
                                },
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, top: 10),
                                child: Container(
                                    alignment: Alignment.topLeft,
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
                                        //print(code.name);
                                      },
                                    ))),
                          ])),
                      SizedBox(height: size.height * 0.03),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Title',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ]),
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0.05),
                          height: size.height * 0.07,
                          width: size.width * 0.9,
                          child: TextField(
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
                            onChanged: (value) {
                              widget.title = value;
                              // print(widget.title);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Period',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ]),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 0.05),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: dropdownValue2 == null
                                          ? Text("Month ")
                                          : Text(
                                              dropdownValue2,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                      isExpanded: true,
                                      iconSize: 30.0,
                                      style: TextStyle(color: Colors.grey),
                                      items: [
                                        "January",
                                        "February",
                                        "March",
                                        "April",
                                        "May",
                                        "June",
                                        "July",
                                        "August",
                                        "September",
                                        "October",
                                        "November",
                                        "December"
                                      ].map(
                                        (val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (val) {
                                        print(val);
                                        setState(
                                          () {
                                            dropdownValue2 = val;
                                          },
                                        );
                                      },
                                    ),
                                  )),
                              SizedBox(height: size.height * 0.03),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: dropdownValue == null
                                          ? Text("Year ")
                                          : Text(
                                              dropdownValue,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                      isExpanded: true,
                                      iconSize: 30.0,
                                      style: TextStyle(color: Colors.grey),
                                      items: [
                                        "2021",
                                        "2020",
                                        "2019",
                                        "2018",
                                        "2017",
                                        "2016",
                                        "2015",
                                        "2014",
                                        "2013",
                                        "2012",
                                        "2011",
                                        "2010",
                                        "2009",
                                        "2008",
                                        "2007",
                                        "2006",
                                        "2005",
                                        "2004",
                                        "2003",
                                        "2002",
                                        "2001",
                                        "2000",
                                        "1999",
                                        "1998",
                                      ].map(
                                        (val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (val) {
                                        print(val);
                                        setState(
                                          () {
                                            dropdownValue = val;
                                          },
                                        );
                                      },
                                    ),
                                  ))
                            ],
                          )),
                      SizedBox(height: size.height * 0.03),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'through',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ]),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 0.05),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: dropdownValue3 == null
                                          ? Text("Month ")
                                          : Text(
                                              dropdownValue3,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                      isExpanded: true,
                                      iconSize: 30.0,
                                      style: TextStyle(color: Colors.grey),
                                      items: [
                                        "January",
                                        "February",
                                        "March",
                                        "April",
                                        "May",
                                        "June",
                                        "July",
                                        "August",
                                        "September",
                                        "October",
                                        "November",
                                        "December"
                                      ].map(
                                        (val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (val) {
                                        print(val);
                                        setState(
                                          () {
                                            dropdownValue3 = val;
                                          },
                                        );
                                      },
                                    ),
                                  )),
                              SizedBox(height: size.height * 0.03),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 0.05),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        hint: dropdownValue4 == null
                                            ? Text("Year ")
                                            : Text(
                                                dropdownValue4,
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                        isExpanded: true,
                                        iconSize: 30.0,
                                        style: TextStyle(color: Colors.grey),
                                        items: [
                                          "2021",
                                          "2020",
                                          "2019",
                                          "2018",
                                          "2017",
                                          "2016",
                                          "2015",
                                          "2014",
                                          "2013",
                                          "2012",
                                          "2011",
                                          "2010",
                                          "2009",
                                          "2008",
                                          "2007",
                                          "2006",
                                          "2005",
                                          "2004",
                                          "2003",
                                          "2002",
                                          "2001",
                                          "2000",
                                          "1999",
                                          "1998",
                                        ].map(
                                          (val) {
                                            return DropdownMenuItem<String>(
                                              value: val,
                                              child: Text(val),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (val) {
                                          print(val);
                                          setState(
                                            () {
                                              dropdownValue4 = val;
                                            },
                                          );
                                        },
                                      ),
                                    )),
                              )
                            ],
                          )),
                    ])),
            SizedBox(height: size.height * 0.03),
            ListTileTheme(
              contentPadding: EdgeInsets.zero,
              child: CheckboxListTile(
                title: Text(
                  "I Currently work here",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
                checkColor: Colors.greenAccent,
                activeColor: Color(0XFF0F8E0F),
                value: this.valuesecond,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool value) {
                  setState(() {
                    this.valuesecond = value;
                    print(value);
                  });
                },
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Text(
                'Description',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0.05),
                // height: size.height * 0.07,
                // width: size.width * 0.9,
                child: TextField(
                  maxLines: 3,
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
                  onChanged: (value) {
                    widget.description = value;
                    // print(widget.description);
                  },
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Cancel",
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
                      border: Border.all(color: Color(0xFF15A800)),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: FlatButton(
                      color: Color(0xFF15A800),
                      onPressed: () => {
                        DatabaseService()
                            .updateDocument('talent', auth.currentUser.uid, {
                          'company': [
                            {
                              'companyName': widget.company,
                              'jobTitle': widget.title,
                              'stillWork': valuesecond,
                              'companyLocation': widget.location,
                            }
                          ]
                        }),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LanguageProficiency();
                            },
                          ),
                        )
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ]),
          ]))),
    );
  }
}
