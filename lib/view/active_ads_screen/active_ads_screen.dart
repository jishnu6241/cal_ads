import 'package:cal_ads/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActiveAds extends StatelessWidget {
  const ActiveAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colorconstant.primerycolor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: [
            Material(
              borderRadius: BorderRadius.circular(20),
              color: Colorconstant.tertiarycolor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Poster Billboard",
                          style: GoogleFonts.lindenHill(
                              fontSize: 20, color: Colorconstant.primerycolor),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colorconstant.secondarycolor,
                          child: Icon(
                            Icons.image,
                            color: Colorconstant.primerycolor,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "Duration",
                          style: GoogleFonts.lindenHill(
                              fontSize: 20, color: Colorconstant.primerycolor),
                        ),
                      ],
                    ),
                    Text(
                      "location",
                      style: GoogleFonts.lindenHill(
                          fontSize: 20, color: Colorconstant.primerycolor),
                    ),
                    Text(
                      "Paid",
                      style: GoogleFonts.lindenHill(
                          fontSize: 20, color: Colorconstant.primerycolor),
                    ),
                    Text(
                      "Expiring Date",
                      style: GoogleFonts.lindenHill(
                          fontSize: 20, color: Colorconstant.primerycolor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
