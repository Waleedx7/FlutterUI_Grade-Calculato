// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var literalScore = "-";

  final scoreTextController = TextEditingController();

  void calculateScore(BuildContext context) {
    final grade = double.parse(scoreTextController.text);
    setState(() {
      if (grade >= 90) {
        // showSnack(context, "A");
        literalScore = "A";
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("A")));
      } else if (grade >= 80) {
        // showSnack(context, "B");
        literalScore = "B";
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("B")));
      } else if (grade >= 70) {
        // showSnack(context, "C");
        literalScore = "C";
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("C")));
      } else {
        // showSnack(context, "F");
        literalScore = "F";
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("F")));
      }
    });
  }

  void showSnack(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grade Calculator"),
        backgroundColor: Color(0XFF59C2FD),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: scoreTextController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Type Your Score",
                    prefixIcon: Icon(Icons.forward_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                )),
            ElevatedButton(
              onPressed: () {
                calculateScore(context);
              },
              child: Text("Calculate"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue, onPrimary: Colors.black),
            ),
            Spacer(),
            Text(
              literalScore,
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
