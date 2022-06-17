import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ChooseGenderCard extends StatelessWidget {
  ChooseGenderCard({@required this.genderIcon, @required this.gender});

  final IconData genderIcon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(height: 15.0),
        Text(
          gender,
          style: kSmallTextStyle,
        )
      ],
    );
  }
}
