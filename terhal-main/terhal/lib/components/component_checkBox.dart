import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  Function onChanged;
  CustomCheckBox({this.onChanged});
  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: checkBoxValue,
        onChanged: (bool value) {
          widget.onChanged(value);
          setState(() {
            checkBoxValue = value;
          });
        });
  }
}
