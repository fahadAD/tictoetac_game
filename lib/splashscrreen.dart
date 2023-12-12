import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';
class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 6), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => GameHome(),));
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("Welcome To",style: GoogleFonts.pacifico(color: Colors.white,fontSize: 40),)),

            Center(child: Text("Tic Tac Toe",style: GoogleFonts.pressStart2p(color: Colors.white,fontSize: 23),)),

            Center(child: Text("I hope you will enjoy the game..",style: GoogleFonts.pacifico(color: Colors.white,fontSize: 20),)),


            Center(child: CircularProgressIndicator(color: Colors.white)),

            ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
                onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GameHome(),));
            }, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("  Get Start  ",style: GoogleFonts.pressStart2p(),),
            ))
          ],
        ),
      ),
    );
  }
}
