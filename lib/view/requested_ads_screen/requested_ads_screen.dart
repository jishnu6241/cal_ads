import 'package:cal_ads/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestedAds extends StatelessWidget {
  const RequestedAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colorconstant.primerycolor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Colorconstant.tertiarycolor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Heading",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colorconstant.primerycolor,
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Text(
                              "status",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colorconstant.secondarycolor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Duration",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colorconstant.primerycolor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "View Image",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Duration",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colorconstant.primerycolor,
                          ),
                        ),
                        Text(
                          "Duration",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colorconstant.primerycolor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "suggestion",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colorconstant.primerycolor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
