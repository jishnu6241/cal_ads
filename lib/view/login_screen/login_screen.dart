import 'package:cal_ads/utils/color_constant.dart';
import 'package:cal_ads/view/navigation_rail_screen/navigatiom_rail_screen.dart';
import 'package:cal_ads/view/register_screen/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/custom_alert_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const NavigationRailScreen(),
              ),
              (route) => false);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstant.primerycolor,
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Cal Ads",
                    style: GoogleFonts.lilyScriptOne(
                        fontSize: 50, color: Colorconstant.secondarycolor),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "is  a digital platform which provides users traditional advertising solutions",
                    style: GoogleFonts.inconsolata(
                        fontSize: 20, color: Colorconstant.tertiarycolor),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 180),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: GoogleFonts.lilyScriptOne(
                        fontSize: 50, color: Colorconstant.secondarycolor),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(_emailController.text.trim())) {
                        return null;
                      } else {
                        return "enter a valid email";
                      }
                    },
                    controller: _emailController,
                    style: GoogleFonts.lindenHill(
                        color: Colorconstant.primerycolor,
                        fontSize: 22,
                        fontWeight: FontWeight.normal),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value != null && value.length >= 6) {
                        return null;
                      } else {
                        return "Enter a valid password";
                      }
                    },
                    controller: _passwordController,
                    obscureText: true,
                    obscuringCharacter: '*',
                    style: GoogleFonts.lindenHill(
                        color: Colorconstant.primerycolor,
                        fontSize: 22,
                        fontWeight: FontWeight.normal),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't have account? ",
                        style: GoogleFonts.lindenHill(
                            color: Colorconstant.tertiarycolor,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ));
                        },
                        child: Text(
                          " Create  new account ",
                          style: GoogleFonts.lindenHill(
                              color: Colorconstant.secondarycolor,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              )
                              .then(
                                (value) => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NavigationRailScreen(),
                                  ),
                                  (route) => false,
                                ),
                              )
                              .onError(
                                (error, stackTrace) => showDialog(
                                  context: context,
                                  builder: (context) => CustomAlertDialog(
                                    title: "Error",
                                    label: "Something went wrong",
                                    onOk: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              );
                        }
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colorconstant.secondarycolor,
                        ),
                        child: Text(
                          "Login",
                          style: GoogleFonts.lindenHill(
                              fontSize: 20, color: Colorconstant.primerycolor),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
