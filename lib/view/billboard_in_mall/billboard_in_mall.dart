import 'package:cal_ads/utils/color_constant.dart';
import 'package:cal_ads/utils/custom_button.dart';
import 'package:cal_ads/utils/custom_dropdown.dart';
import 'package:cal_ads/utils/custom_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillBoardInMall extends StatefulWidget {
  const BillBoardInMall({super.key});

  @override
  State<BillBoardInMall> createState() => _BillBoardInMallState();
}

class _BillBoardInMallState extends State<BillBoardInMall> {
  String? selectedMallOptions;
  List<String> mallOptions = [
    'Secura mall , Kannur',
    'LULU mall , Kannur',
    'Capital mall , Kannur',
    'G mall , Kannur'
  ];
  List<String> dateDuration = [
    '1 month',
    '6 month',
    '1 year',
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
                      'Billboard in mall',
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
                    selectedMallOptions = select;
                  },
                  dataList: mallOptions,
                  label: 'select Mall',
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  ' Note : "Mall billboard: Impactful advertising within shopping centers, typically sized around 4 feet by 6 feet."',
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
