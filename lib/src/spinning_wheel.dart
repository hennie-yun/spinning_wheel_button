import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'wheel_button.dart';
import 'each_button.dart';

class SpinningWheel extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return   WheelButton(
      bottom: 20,
      containerSize: 300,
      containerBgColor: Colors.grey,
      showLines: true,
      borderColor: Colors.red,
      borderWidth: 2,
      centerWidget: Icon(Icons.star, size: 48, color: Colors.yellow),
      buttons: [
        EachButton(icon: Icons.accessibility, label: '1', labelStyle:  TextStyle(fontSize: 15) , onTap: () {}), //start from left center to clockwise
        EachButton(icon: Icons.person_outline_sharp, label: '2', labelStyle:  TextStyle(fontSize: 15) ,onTap: () {}),
        EachButton(icon: Icons.arrow_back, label: '3',labelStyle:  TextStyle(fontSize: 15) , onTap: () {}),
        EachButton(icon: Icons.book, label: '4', labelStyle:  TextStyle(fontSize: 15) , onTap: () {}),
        // EachButton(icon: Icons.bookmark_add_outlined, label: 'e', onTap: () {}),
        // EachButton(icon: Icons.ac_unit, label: 'f', onTap: () {}),
      ],
    );

  }
}