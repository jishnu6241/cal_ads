import 'package:cal_ads/utils/color_constant.dart';
import 'package:cal_ads/utils/custom_alert_dialog.dart';
import 'package:cal_ads/utils/custom_button.dart';
import 'package:cal_ads/utils/custom_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/custom_dropdown.dart';

class NormalBillboardScreen extends StatefulWidget {
  const NormalBillboardScreen({super.key});

  @override
  State<NormalBillboardScreen> createState() => _NormalBillboardScreenState();
}

class _NormalBillboardScreenState extends State<NormalBillboardScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _suggestionController = TextEditingController();
  PlatformFile? image;
  String? selectedBillboardOptions, selectedLocation, duration;
  List<String> billboardOptions = [
    'Bulletin Billboard',
    'Poster Billboard',
    'Junior poster Billboard',
    'Digital Billboard'
  ];
  List<String> dateDuration = ['1 month', '6 month', '1 year'];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 400,
        child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('ads')
                .where('Type', isEqualTo: 'Billboard')
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              List<String> location = [];
              List<String> prices = [];
              for (var doc in snapshot.data!.docs) {
                // Assuming 'duration' is the field name where duration is stored
                // If duration is stored as a list, replace 'String' with the actual type
                location.add(doc['location']);
                prices.add(doc['price_per_month']);
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        if (selectedBillboardOptions ==
                            'Junior poster Billboard')
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
                            selectedBillboardOptions ==
                                'Junior poster Billboard' ||
                            selectedBillboardOptions == 'Digital Billboard')
                          const SizedBox(
                            height: 20,
                          ),
                        CustomImagePickerButton(
                          width: 360,
                          height: 150,
                          onPick: (file) {
                            image = file;
                          },
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
                        CustomDropDownMenu(
                          onSelected: (select) {
                            duration = select;
                          },
                          dataList: dateDuration,
                          label: 'Select duration',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _suggestionController,
                          minLines: 4,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            hintText: 'Suggestion (optional)',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          label: 'Send',
                          onTap: () async {
                            if (_formKey.currentState!.validate() &&
                                selectedBillboardOptions != null &&
                                selectedLocation != null &&
                                duration != null) {
                              int price = int.parse(
                                  prices[location.indexOf(selectedLocation!)]);

                              var ref = FirebaseStorage.instance.ref().child(
                                  'images/${FirebaseAuth.instance.currentUser!.uid}');
                              await ref.putData(image!.bytes!);
                              var downloadedUrl = await ref.getDownloadURL();

                              await FirebaseFirestore.instance
                                  .collection('user_ads')
                                  .add({
                                    'Type': 'Billboard',
                                    'billboard_type': selectedBillboardOptions,
                                    'uid':
                                        FirebaseAuth.instance.currentUser!.uid,
                                    'image': downloadedUrl,
                                    'location': selectedLocation,
                                    'status': 'pending',
                                    'duration': duration,
                                    'price': duration == '1 month'
                                        ? price
                                        : duration == '6 month'
                                            ? (price * 6)
                                            : (price * 12),
                                    'suggestion':
                                        _suggestionController.text.trim(),
                                  })
                                  .then((value) => Navigator.pop(context))
                                  .onError(
                                    (error, stackTrace) =>
                                        const CustomAlertDialog(
                                            title: "error",
                                            label: "Something went wrong"),
                                  );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
