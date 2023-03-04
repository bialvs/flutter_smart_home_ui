import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {

  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  final Function(bool)? onChanged;

  const SmartDeviceBox({super.key, required this.smartDeviceName, required this.iconPath, required this.powerOn, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        //::::::::::::::: ICONES :::::::::::::
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(iconPath,
            height: 65,
            color: powerOn ? Colors.grey[200] : Colors.grey[800]),
        //:::::::::::::::: NOME DISPOSITIVO :::::::::::
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                        smartDeviceName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: powerOn ? Colors.grey[200] : Colors.grey[800]
                        ),
                      ),
                  )),
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(
                    value: powerOn, 
                    onChanged: onChanged,            
                    ),
                )
              ],
            )
        ]),
      ),
    );
  }
}