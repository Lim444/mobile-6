import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CardName extends StatelessWidget {
  const new({super.key});
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Card Name',
      // Scaffold : halaman kosong
      home: Scaffold(
        backgroundColor: Color.fromARGB(115, 0, 60, 255),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage(
                  //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5WOO6j-9YPM4WnZixEFnDtxCIy4eq42GbpltUKQJg0g&s=10',
                  //   ),
                  //   radius: 70.0,
                  // ),
                  // SizedBox(height: 20.0),
                  // Text(
                  //   'Ishow Speed Ke Indonesia',
                  //   style: GoogleFonts.crimsonPro(
                  //     fontSize: 32,
                  //     fontWeight: .bold,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  SizedBox(height: 20.0),
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/foto_ishowspeed.jpg',
                    ),
                    radius: 70.0,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Ishow Speed',
                    style: GoogleFonts.crimsonPro(
                      fontSize: 32,
                      fontWeight: .bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Content Creator',
                    style: GoogleFonts.crimsonPro(
                      fontSize: 24,
                      fontWeight: .bold,
                      color: Colors.white,
                      letterSpacing: 5,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    width: double.infinity,
                    child: Divider(color: Colors.black),
                  ),
                  // Card / Div
                  Card(
                    // Telepon
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    color: Colors.black,
                    child: ListTile(
                      leading: Icon(Icons.phone_android, color: Colors.white),
                      title: Text(
                        '+62 0850 3672 2377',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Card(
                    // Email
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    color: Colors.black,
                    child: ListTile(
                      leading: Icon(Icons.email, color: Colors.white),
                      title: Text(
                        'ishowspeed7@gmail.com',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Card(
                    // Alamat
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    color: Colors.black,
                    child: ListTile(
                      leading: Icon(Icons.location_on, color: Colors.white),
                      title: Text(
                        'Cincinnati, Ohio, Amerika Serikat',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Card(
                    // Youtube
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    color: Colors.black,
                    child: ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.youtube,
                        color: Colors.white,
                      ),
                      title: Text(
                        'IShowSpeed',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Card(
                    // Instagram
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    color: Colors.black,
                    child: ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                      ),
                      title: Text(
                        '@ishowspeed',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
