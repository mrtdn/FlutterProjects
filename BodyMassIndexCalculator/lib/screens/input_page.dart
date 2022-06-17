import 'package:bmi_calculator/models/calculator.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../models/RoundIconButton.dart';
import '../models/choose_gender.dart';
import '../models/reusable_card.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = Color(kMainBoxColor);
  Color femaleCardColor = Color(kMainBoxColor);
  Gender selectedGender;
  double _currentSliderValue = 170.0;
  double _weight = 70;
  double _age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.MALE;
                        _currentSliderValue = 180.0;
                        _weight = 75.0;
                        _age = 20;
                      });
                    },
                    color: (selectedGender == Gender.MALE)
                        ? (Color(kActiveCardColor))
                        : (Color(kMainBoxColor)),
                    childWidget: ChooseGenderCard(
                      genderIcon: FontAwesomeIcons.mars,
                      gender: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.FEMALE;
                        _currentSliderValue = 165.0;
                        _weight = 60.0;
                        _age = 20;
                      });
                    },
                    color: (selectedGender == Gender.FEMALE)
                        ? (Color(kActiveCardColor))
                        : (Color(kMainBoxColor)),
                    childWidget: ChooseGenderCard(
                      genderIcon: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kSmallTextStyle,
                    ),
                    Text(
                      _currentSliderValue.round().toString(),
                      style: kLargeTextStyle,
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x29EB1555),
                      ),
                      child: Slider(
                        value: _currentSliderValue,
                        max: 230,
                        min: 60,
                        divisions: 170,
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                color: Color(kMainBoxColor)),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: Color(kMainBoxColor),
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kSmallTextStyle,
                        ),
                        Text(
                          _weight.round().toString(),
                          style: kLargeTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              function: () {
                                setState(() {
                                  _weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              function: () {
                                setState(() {
                                  _weight++;
                                });
                              },
                            )
                          ], // here
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: Color(kMainBoxColor),
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kSmallTextStyle,
                        ),
                        Text(
                          _age.round().toString(),
                          style: kLargeTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                function: () {
                                  setState(() {
                                    _age--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                function: () {
                                  setState(() {
                                    _age++;
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              print(_weight.toString() + ' ' + _currentSliderValue.toString());
              Calculator calculate = Calculator(_weight, _currentSliderValue);

              String bmi = calculate.fetchBMI();
              String resultText = calculate.fetchResultText();
              print(bmi + ' ' + resultText);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ResultPage(resultText: resultText, bmi: bmi)));
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 10.0),
              alignment: Alignment.center,
              child: Text(
                'Calculate',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
              decoration: BoxDecoration(
                  color: Color(kSecondColor),
                  borderRadius: BorderRadius.circular(10.0)),
              width: double.infinity,
              height: kBottomContainerHeight,
              margin: EdgeInsets.only(top: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}
