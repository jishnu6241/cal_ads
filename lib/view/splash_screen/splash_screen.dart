import 'dart:async';

import 'package:cal_ads/utils/color_constant.dart';
import 'package:cal_ads/view/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      ));
    });
    return Scaffold(
      backgroundColor: Colorconstant.primerycolor,
      body: Center(
        child: Text(
          "Cal Ads",
          style: GoogleFonts.lilyScriptOne(
              fontSize: 40, color: Colorconstant.secondarycolor),
        ),
      ),
    );
  }
}
