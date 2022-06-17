import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/models/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.resultText, @required this.bmi});

  String resultText;
  String bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Expanded(
              child: Text(
                'YOUR RESULT',
                style: kLargeTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: ReusableCard(
              childWidget: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText,
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                    Text(
                      bmi,
                      style: TextStyle(
                          fontSize: 70.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              color: Color(kMainBoxColor),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: kBottomContainerHeight,
              decoration: BoxDecoration(
                  color: Color(kSecondColor),
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
              alignment: Alignment.center,
              child: Text(
                'Re-calculate',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
