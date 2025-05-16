import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://e1.pxfuel.com/desktop-wallpaper/832/126/desktop-wallpaper-anime-school-classroom-desks-wind-lonely-boy-school-room.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Color.fromARGB(
                92,
                0,
                0,
                0,
              ), // Black with 50% opacity (hex: 0x80 = 50%)
              BlendMode.darken,
            ),
          ),
        ),
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(), // Empty top spacer
            Column(
              children: [
                Image.network(
                  'https://www.pngmart.com/files/19/Quiz-Logo-PNG-HD.png',
                  width: 350,
                ),
                Text(
                  'Welcome to Quiz App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Palatino',
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'We are creative, enjoy the app ;)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman',
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
              ),
              child: Text(
                'Start',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Garamond',
                ),
              ),
            ),

            //
          ],
        ),
      ),
    );
  }
}