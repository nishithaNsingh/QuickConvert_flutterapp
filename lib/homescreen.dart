import 'package:flutter/material.dart';
import 'dropdown.dart';
import 'logicpage.dart'; // Assuming this file contains the convert function

const List<String> list = <String>[
  "Millimeter(mm)", "Centimeter(cm)", "Meter(m)", "Kilometer(km)",
  "Inch(in)", "Foot(ft)", "Yards(yd)", "Mile(mi)"
];

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String fromUnit = list.first;
  String toUnit = list.first;
  TextEditingController inputController = TextEditingController();
  String? result;

  void handleConversion() {
    double? inputValue = double.tryParse(inputController.text);
    if (inputValue != null) {
      setState(() {
        result = convert(inputValue, fromUnit, toUnit);
      });
    } else {
      setState(() {
        result = "Please enter a valid number";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QuickConvert"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonHome(
              value: fromUnit,
              onChanged: (String value) {
                setState(() {
                  fromUnit = value;
                  // Optionally trigger conversion immediately on change
                  // convert(inputValue, fromUnit, toUnit);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  child: TextField(
                    controller: inputController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your input',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonHome(
              value: toUnit,
              onChanged: (String value) {
                setState(() {
                  toUnit = value;
                  // Optionally trigger conversion immediately on change
                  // convert(inputValue, fromUnit, toUnit);
                });
              },
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: handleConversion,
            child: Icon(Icons.import_export_sharp),
          ),
          SizedBox(height: 20,),
          if (result != null)
            Text(
              result!,
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
