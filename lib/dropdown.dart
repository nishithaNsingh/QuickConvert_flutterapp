import 'package:flutter/material.dart';
import 'package:quick_convert/homescreen.dart';

class DropdownButtonHome extends StatefulWidget {
  final String value;
  final ValueChanged<String>? onChanged;

  const DropdownButtonHome({Key? key, required this.value, this.onChanged})
      : super(key: key);

  @override
  State<DropdownButtonHome> createState() => _DropdownButtonHomeState();
}

class _DropdownButtonHomeState extends State<DropdownButtonHome> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.value,
      icon: Icon(Icons.arrow_drop_down),
      elevation: 5,
      style: TextStyle(color: Colors.orange, fontSize: 25),
      onChanged: (String? value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value!);
        }
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
