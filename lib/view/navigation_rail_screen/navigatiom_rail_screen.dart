import 'package:cal_ads/utils/color_constant.dart';
import 'package:cal_ads/utils/custom_alert_dialog.dart';
import 'package:cal_ads/view/contact_us_screen/contact_us_screen.dart';
import 'package:cal_ads/view/home_screen/home_screen.dart';
import 'package:cal_ads/view/login_screen/login_screen.dart';
import 'package:cal_ads/view/requested_ads_screen/requested_ads_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationRailScreen extends StatefulWidget {
  const NavigationRailScreen({super.key});

  @override
  State<NavigationRailScreen> createState() => _NavigationRailScreenState();
}

class _NavigationRailScreenState extends State<NavigationRailScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const RequestedAds(),
    const ContactUs(),
  ];

  int _selecetdIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstant.primerycolor,
      body: Row(
        children: [
          NavigationRail(
            trailing: Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 70, bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => CustomAlertDialog(
                          title: "Log Out",
                          label: "Are you Sure?",
                          onLogout: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                                (route) => false);
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.logout_outlined,
                            color: Colorconstant.primerycolor),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Log Out",
                          style: GoogleFonts.lindenHill(
                              fontSize: 24, color: Colorconstant.primerycolor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    "Cal Ads",
                    style: GoogleFonts.lilyScriptOne(
                        fontSize: 35, color: Colorconstant.primerycolor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            extended: true,
            backgroundColor: Colorconstant.tertiarycolor,
            destinations: [
              NavigationRailDestination(
                icon: Icon(
                  Icons.home,
                  color: _selecetdIndex == 0
                      ? Colorconstant.tertiarycolor
                      : Colorconstant.secondarycolor,
                ),
                label: Text(
                  'Types Of Ads',
                  style: GoogleFonts.lindenHill(
                    fontSize: 20,
                    fontWeight: _selecetdIndex == 0
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: _selecetdIndex == 0
                        ? Colorconstant.primerycolor
                        : Colorconstant.secondarycolor,
                  ),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.info,
                  color: _selecetdIndex == 1
                      ? Colorconstant.tertiarycolor
                      : Colorconstant.secondarycolor,
                ),
                label: Text(
                  'Request Info',
                  style: GoogleFonts.lindenHill(
                    fontWeight: _selecetdIndex == 1
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: 20,
                    color: _selecetdIndex == 1
                        ? Colorconstant.primerycolor
                        : Colorconstant.secondarycolor,
                  ),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.help,
                  color: _selecetdIndex == 2
                      ? Colorconstant.tertiarycolor
                      : Colorconstant.secondarycolor,
                ),
                label: Text(
                  'Contact Us',
                  style: GoogleFonts.lindenHill(
                    fontWeight: _selecetdIndex == 2
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: 20,
                    color: _selecetdIndex == 2
                        ? Colorconstant.primerycolor
                        : Colorconstant.secondarycolor,
                  ),
                ),
              ),
            ],
            onDestinationSelected: (int index) {
              setState(() {
                _selecetdIndex = index;
              });
            },
            selectedIndex: _selecetdIndex,
          ),
          Expanded(child: screens[_selecetdIndex])
        ],
      ),
    );
  }
}
