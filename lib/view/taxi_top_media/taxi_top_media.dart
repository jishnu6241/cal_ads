import 'package:cal_ads/utils/color_constant.dart';
import 'package:cal_ads/utils/custom_dropdown.dart';
import 'package:cal_ads/utils/custom_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/custom_button.dart';

class TaxiTopMedia extends StatefulWidget {
  const TaxiTopMedia({super.key});

  @override
  State<TaxiTopMedia> createState() => _TaxiTopMediaState();
}

class _TaxiTopMediaState extends State<TaxiTopMedia> {
  String? selectedTaxi, selectedLocation;
  List<String> taxiOptions = [
    'KL 13 AU 6241',
    'KL 13 S 4749',
    'KL 13 U 6904',
    'KL 13 J 8055'
  ];
  List<String> dateDuration = [
    '1 month',
    '2 month',
    '6 month',
  ];
  List<String> location = ['Kannur', 'Eranakulam', 'Kollam', 'Kozhikode'];
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
                      'Taxi top media',
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
                    selectedTaxi = select;
                  },
                  dataList: taxiOptions,
                  label: 'select taxi',
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  ' Note : "Taxi top media comprises advertising displays affixed to the roofs of taxis or rideshare vehicles, featuring LED screens or printed panels showcasing dynamic content. Measuring approximately 3 feet by 7 feet, these mobile platforms offer advertisers a versatile medium to reach diverse audiences as vehicles traverse urban landscapes, capturing the attention of pedestrians, motorists, and passengers alike."',
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
                CustomDropDownMenu(
                  onSelected: (select) {
                    selectedLocation = select;
                  },
                  dataList: location,
                  label: 'Select location',
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
