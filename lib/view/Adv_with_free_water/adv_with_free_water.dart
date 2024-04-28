import 'package:cal_ads/utils/color_constant.dart';
import 'package:cal_ads/utils/custom_button.dart';
import 'package:cal_ads/utils/custom_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvWithFreeWater extends StatelessWidget {
  const AdvWithFreeWater({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Free water adv',
                      style: GoogleFonts.lindenHill(
                        fontSize: 33,
                        color: Colorconstant.secondarycolor,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Add location here',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  ' Note : "Maximize your branding potential with ads on our sleek, eco-friendly bottles. Display local businesses, environmental messages, and wellness tips on every label. Engage consumers with QR codes and trivia, all on a compact, portable design."',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colorconstant.secondarycolor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomImagePickerButton(
                  width: 360,
                  height: 150,
                  onPick: (file) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colorconstant.secondarycolor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'date & time',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colorconstant.primerycolor,
                            ),
                          ),
                          Icon(
                            Icons.calendar_month,
                            color: Colorconstant.primerycolor,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  minLines: 4,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Suggestion (optional)',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.currency_rupee,
                      color: Colorconstant.secondarycolor,
                    ),
                    Text(
                      '500',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colorconstant.secondarycolor,
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      label: 'Send',
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
