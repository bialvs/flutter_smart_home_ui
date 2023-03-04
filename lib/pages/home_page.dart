import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome_ui/util/smart_devices_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // ::::::::: CONSTANTES PADDING :::::::::
  final double horizontalPadding = 40.0;
  final double verticalPadding = 25.0;

  // ::::::::: LISTA DE DISPOSITIVOS ::::::

  List meusDispositivos = [
    ['Smart Light', 'lib/assets/light-bulb.png', true],
    ['Smart AC', 'lib/assets/air-conditioner.png', false],
    ['Smart TV', 'lib/assets/smart-tv.png', false],
    ['Smart Fan', 'lib/assets/fan.png', false],
  ];


  void powerSwitchChanged(bool value, int index){
    setState(() {
      meusDispositivos[index][2] = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //:::::::::::: APP BAR :::::::::::::
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, 
                vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // :::::::::::::::: ICONE MENU :::::::::::
                  Image.asset('lib/assets/menu.png',
                  height: 45,
                  color: Colors.grey[800],),
                  // :::::::::::::::: ICONE CONTA ::::::::::
                  Icon(Icons.person,
                  size: 45,
                  color: Colors.grey[800],)
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //:::::::::::::: SEJA BEM-VINDO ::::::::::::::::

            Padding(
              padding: const EdgeInsets.only(right: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Seja bem-vindo,',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[900]
                  ),),
                  Text('BEATRIZ',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 72,
                    color: Colors.grey[900],
                  )
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),

            //:::::::::::::: DISPOSITIVOS :::::::::::

            const Padding(
              padding: EdgeInsets.only(right: 170),
              child: Text('DISPOSITIVOS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),
            ),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(25.0),
                itemCount: meusDispositivos.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3
                ), 
              itemBuilder: (BuildContext context, int index) {  
                return SmartDeviceBox(
                  smartDeviceName: meusDispositivos[index][0],
                  iconPath: meusDispositivos[index][1],
                  powerOn: meusDispositivos[index][2],
                  onChanged: (value) => powerSwitchChanged(value, index),
                );
              },)
            )
            
          ],
        ),
      ),
    );
  }
}