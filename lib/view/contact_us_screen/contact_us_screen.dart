import 'package:cal_ads/utils/color_constant.dart';
import 'package:cal_ads/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colorconstant.primerycolor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Us',
                  style: GoogleFonts.lindenHill(
                    fontSize: 35,
                    color: Colorconstant.secondarycolor,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Title',
                  style: GoogleFonts.lindenHill(
                    fontSize: 35,
                    color: Colorconstant.secondarycolor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'add your title here',
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Description',
                  style: GoogleFonts.lindenHill(
                    fontSize: 35,
                    color: Colorconstant.secondarycolor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 5,
                  minLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'add your description here',
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      label: 'Send',
                      onTap: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
