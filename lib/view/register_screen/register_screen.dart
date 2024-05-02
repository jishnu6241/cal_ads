import 'dart:developer';

import 'package:cal_ads/utils/color_constant.dart';
import 'package:cal_ads/view/login_screen/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void createUser() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'email': _emailController.text.trim(),
        'phone': _phoneController.text.trim(),
      });
    } catch (e) {
      log("error====$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstant.primerycolor,
      body: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colorconstant.secondarycolor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cal Ads",
                        style: GoogleFonts.lilyScriptOne(
                            fontSize: 35, color: Colorconstant.primerycolor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "is  a digital platform which provides users traditional advertising solutions",
                        style: GoogleFonts.inconsolata(
                            fontSize: 20, color: Colorconstant.primerycolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "welcome back",
                        style: GoogleFonts.lilyScriptOne(
                            fontSize: 35, color: Colorconstant.primerycolor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "if you already have an account then you can press the login button below",
                        style: GoogleFonts.inconsolata(
                            fontSize: 20, color: Colorconstant.primerycolor),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colorconstant.primerycolor,
                            ),
                            child: Text(
                              "Login",
                              style: GoogleFonts.lindenHill(
                                  fontSize: 24,
                                  color: Colorconstant.secondarycolor),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                color: Colorconstant.primerycolor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create an Account",
                            style: GoogleFonts.lilyScriptOne(
                                fontSize: 35,
                                color: Colorconstant.secondarycolor),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 40,
                              ),
                              child: ConstrainedBox(
                                constraints:
                                    const BoxConstraints.tightFor(width: 400),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 70,
                                      backgroundColor:
                                          Colorconstant.secondarycolor,
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    TextFormField(
                                      controller: _emailController,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Email',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    TextFormField(
                                      obscureText: true,
                                      obscuringCharacter: '*',
                                      style: GoogleFonts.lindenHill(
                                          color: Colorconstant.primerycolor,
                                          fontSize: 22,
                                          fontWeight: FontWeight.normal),
                                      controller: _passwordController,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Password',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    TextFormField(
                                      obscureText: true,
                                      obscuringCharacter: '*',
                                      style: GoogleFonts.lindenHill(
                                          color: Colorconstant.primerycolor,
                                          fontSize: 22,
                                          fontWeight: FontWeight.normal),
                                      controller: _confirmPasswordController,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Confirm Passoword',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    TextFormField(
                                      style: GoogleFonts.lindenHill(
                                          color: Colorconstant.primerycolor,
                                          fontSize: 22,
                                          fontWeight: FontWeight.normal),
                                      controller: _phoneController,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Phone number',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    CustomButton(
                                      label: 'Register',
                                      onTap: () {
                                        createUser();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen(),
                                            ));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
