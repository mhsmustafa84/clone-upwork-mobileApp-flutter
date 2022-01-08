import 'package:flutter/material.dart';

import 'package:upwork/View/components/Shared/CustomIcon.dart';
import 'package:upwork/View/components/beforeLogin/Loginbtn.dart';

class AddLanguage extends StatefulWidget {
  final Function addLanguage;
  List languages;
  AddLanguage({this.addLanguage, this.languages});
  @override
  _AddLanguageState createState() => _AddLanguageState();
}

class _AddLanguageState extends State<AddLanguage> {
  // bool valuefirst = false;
  // bool valuesecond = false;
  String lang, proficiency;
  // void changed() {
  //   setState(() {
  //     widget.addLanguage = !widget.addLanguage;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Language ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              width: MediaQuery.of(context).size.width * 0.75,
              height: 37,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0XFF0F8E0F)),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: lang == null
                        ? Text("Select Language")
                        : Text(
                            lang,
                            style: TextStyle(color: Colors.grey),
                          ),
                    isExpanded: true,
                    iconSize: 30.0,
                    style: TextStyle(color: Colors.grey),
                    items: ['Arabic', 'French', 'Spanish', 'Hindi'].map(
                      (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                        () {
                          lang = val;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            InkWell(
              child: CustomIcon(Icons.delete),
              onTap: () {
                widget.addLanguage();
              },
            )
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Proficiency ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 8),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 37,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0XFF0F8E0F)),
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: proficiency == null
                    ? Text("Select Proficiency")
                    : Text(
                        proficiency,
                        style: TextStyle(color: Colors.grey),
                      ),
                isExpanded: true,
                iconSize: 30.0,
                style: TextStyle(color: Colors.grey),
                items: [
                  'Basic',
                  'Conversational',
                  'Fluent',
                  'Native or Bilingual'
                ].map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      proficiency = val;
                    },
                  );
                },
              ),
            ),
          ),
        ),
        RoundedButton(
          color: Color(0XFF37a000),
          text: "Add",
          textColor: Colors.white,
          borderColor: Color(0x00000000),
          press: () {
            if (lang != null && proficiency != null) {
              widget.languages.add({"language": lang, "langProf": proficiency});
            }
            print(widget.languages);
            widget.addLanguage();
          },
        ),
      ],
    );
  }
}
