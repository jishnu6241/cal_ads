import 'package:cal_ads/utils/color_constant.dart';
import 'package:cal_ads/utils/custom_button.dart';
import 'package:cal_ads/utils/custom_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/custom_dropdown.dart';

class NormalBillboardScreen extends StatefulWidget {
  const NormalBillboardScreen({super.key});

  @override
  State<NormalBillboardScreen> createState() => _NormalBillboardScreenState();
}

class _NormalBillboardScreenState extends State<NormalBillboardScreen> {
  String? selectedBillboardOptions;
  List<String> billboardOptions = [
    'Bulletin Billboard',
    'Poster Billboard',
    'Junior poster Billboard',
    'Digital Billboard'
  ];
  List<String> dateDuration = [
    '1 month',
    '6 month',
    '1 year',
  ];
  List<String> location = [
    'kannur',
    'Puthiyatheru',
    'Parassini',
  ];
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Billboard',
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
                  onSelected: (select) {
                    setState(() {});
                    selectedBillboardOptions = select;
                  },
                  dataList: billboardOptions,
                  label: 'select type',
                ),
                const SizedBox(
                  height: 20,
                ),
                if (selectedBillboardOptions == 'Bulletin Billboard')
                  Text(
                    ' Note : There are different types of billboards, and one of the largest and most impactful is the "bulletin" size. These billboards are usually about 14 feet high and 48 feet wide.',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colorconstant.secondarycolor,
                    ),
                  ),
                if (selectedBillboardOptions == 'Poster Billboard')
                  Text(
                    ' Note : "A poster billboard, typically sized at 10 feet by 20 feet, is a colossal outdoor advertising fixture showcasing captivating graphics and messages. Strategically placed, it aims to engage passersby and motorists with its prominent presence."',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colorconstant.secondarycolor,
                    ),
                  ),
                if (selectedBillboardOptions == 'Junior poster Billboard')
                  Text(
                    ' Note : "A junior poster billboard, measuring around 6 feet by 12 feet, is a compact outdoor advertising platform featuring impactful visuals and concise messaging. Positioned strategically, it aims to engage pedestrians and drivers with its smaller yet attention-grabbing display."',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colorconstant.secondarycolor,
                    ),
                  ),
                if (selectedBillboardOptions == 'Digital Billboard')
                  Text(
                    ' Note : "A digital billboard, typically sized around 14 feet by 48 feet, utilizes dynamic LED technology to deliver vivid visuals and rotating messages. Its expansive display and strategic placement make it an attention-grabbing fixture in outdoor advertising."',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colorconstant.secondarycolor,
                    ),
                  ),
                if (selectedBillboardOptions == 'Bulletin Billboard' ||
                    selectedBillboardOptions == 'Poster Billboard' ||
                    selectedBillboardOptions == 'Junior poster Billboard' ||
                    selectedBillboardOptions == 'Digital Billboard')
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
                CustomDropDownMenu(
                  dataList: location,
                  label: 'Select location',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomDropDownMenu(
                  dataList: dateDuration,
                  label: 'Select duration',
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
