import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: _dropDownValue == null
          ? const Text('Select Gender')
          : Text(
              _dropDownValue!,
            ),
      isExpanded: true,
      iconSize: 30.0,
      items: ['Wife', 'Husband', 'Both'].map(
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
            _dropDownValue = val! as String?;
          },
        );
      },
    );
  }
}
