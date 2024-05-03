import 'package:cal_ads/utils/color_constant.dart';
import 'package:cal_ads/utils/custom_button.dart';
import 'package:cal_ads/utils/custom_dropdown.dart';
import 'package:cal_ads/utils/custom_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvWithFreeWater extends StatefulWidget {
  const AdvWithFreeWater({super.key});

  @override
  State<AdvWithFreeWater> createState() => _AdvWithFreeWaterState();
}

class _AdvWithFreeWaterState extends State<AdvWithFreeWater> {
  TextEditingController dateController = TextEditingController();
  TextEditingController bottleCount = TextEditingController();
  TextEditingController suggestionController = TextEditingController();
  List<String> selectLocation = ['Kannur', 'Eranakulam', 'Kollam', 'Kozhikode'];

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
                CustomDropDownMenu(
                    dataList: selectLocation, label: 'select Location'),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: bottleCount,
                  decoration: const InputDecoration(
                    hintText: 'Type count',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  ' Note : 50 Rs per bottle',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colorconstant.secondarycolor,
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
                TextFormField(
                  controller: dateController,
                  focusNode: FocusNode(canRequestFocus: false),
                  decoration: InputDecoration(
                      hintText: 'Pick date',
                      suffixIcon: Icon(
                        Icons.calendar_month_outlined,
                        color: Colorconstant.primerycolor,
                      )),
                  readOnly: true,
                  onTap: () {
                    _selectDate();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: suggestionController,
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

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());
    if (picked != null) {
      setState(() {
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
