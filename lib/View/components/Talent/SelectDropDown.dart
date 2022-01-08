import 'package:flutter/material.dart';
import '../../../constanse.dart';

class SelectDropDown extends StatefulWidget {
  final List listItems;
  final bool isExpand;
  String dropdownValue;
  SelectDropDown( this.listItems, {this.isExpand});
  @override
  _SelectDropDownState createState() => _SelectDropDownState();
}

class _SelectDropDownState extends State<SelectDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.5,
            color: bgUpworkSection,
          ),
        ),
      ),
      child: DropdownButton(
        hint: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10),
          child: Text(widget.listItems.first),
        ),
        value: widget.dropdownValue,
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 8.0, right: 10),
          child: Icon(Icons.arrow_drop_down),
        ),
        isExpanded: widget.isExpand == true ? true : false,
        onChanged: (newValue) {
          setState(() {
            widget.dropdownValue = newValue;
          });
        },
        items: widget.listItems.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(valueItem),
            ),
          );
        }).toList(),
      ),
    );
  }
}
