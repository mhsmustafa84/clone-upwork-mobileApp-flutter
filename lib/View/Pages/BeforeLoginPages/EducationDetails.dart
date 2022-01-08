import 'package:flutter/material.dart';
import 'package:upwork/Services/DatabaseService.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/Employment.dart';
import 'package:upwork/View/components/Shared/CustomDrawer.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';
import 'package:upwork/View/components/Talent/SelectDropDown.dart';
import 'package:upwork/firebaseApp.dart';

class EducationDetails extends StatefulWidget {
  String school;
  String degree;
  String areaofstudy;
  String description;

  EducationDetails({
    this.school,
    this.degree,
    this.areaofstudy,
    this.description,
  });
  @override
  _EducationDetailsState createState() => _EducationDetailsState();
}

class _EducationDetailsState extends State<EducationDetails> {
  String dropdownValue, dropdownValue2;
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
                "Add Education",
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
                              'School',
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
                              hintText: "Ex:Northwestern University",
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0XFF0F8E0F), width: 2.0),
                              ),
                            ),
                            onChanged: (value) {
                              widget.school = value;
                              //print(widget.school);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Area of study',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '(Optional)',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
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
                                hintText: "Ex:Computer Science",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0XFF0F8E0F), width: 2.0),
                                ),
                              ),
                              onChanged: (value) {
                                widget.areaofstudy = value;
                                //print(widget.areaofstudy);
                              },
                            ),
                          )),
                      SizedBox(height: size.height * 0.03),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Degree',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '(Optional)',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
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
                                hintText: 'Ex:Bachelor',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0XFF0F8E0F), width: 2.0),
                                ),
                              ),
                              onChanged: (value) {
                                widget.degree = value;
                                //print(widget.degree);
                              },
                            ),
                          )),
                      SizedBox(height: size.height * 0.03),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Dates Attended',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '(Optional)',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ]),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0.05),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: dropdownValue == null
                                  ? Text('From')
                                  : Text(
                                      dropdownValue,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                              isExpanded: true,
                              iconSize: 30.0,
                              style: TextStyle(color: Colors.grey),
                              items: [
                                "From",
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
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0.05),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: dropdownValue2 == null
                                    ? Text('To(expected graduation year)')
                                    : Text(
                                        dropdownValue2,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                isExpanded: true,
                                iconSize: 30.0,
                                style: TextStyle(color: Colors.grey),
                                items: [
                                  "2028",
                                  "2027",
                                  "2026",
                                  "2025",
                                  "2024",
                                  "2023",
                                  "2022",
                                  "2021",
                                  "2020",
                                  "2019",
                                  "2018",
                                  "2017",
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
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'description',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '(Optional)',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
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
                            child: TextField(
                              maxLines: 4,
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
                                //print(widget.description);
                              },
                            ),
                          )),
                    ])),
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
                          'education': {
                            'school': widget.school,
                            'degree': widget.degree,
                            'areaOfStudy': widget.areaofstudy,
                            // 'gradYear':
                          }
                        }),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Employement();
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
                  SizedBox(height: size.height * 0.03),
                ]),
          ]))),
    );
  }
}
