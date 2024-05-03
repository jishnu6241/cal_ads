import 'package:cal_ads/utils/color_constant.dart';
import 'package:cal_ads/utils/custom_alert_dialog.dart';
import 'package:cal_ads/utils/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colorconstant.primerycolor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
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
                    validator: (value) {
                      if (value != null) {
                        return null;
                      } else {
                        return "Enter vaild title";
                      }
                    },
                    controller: title,
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
                    validator: (value) {
                      if (value != null) {
                        return null;
                      } else {
                        return "Enter a valid description";
                      }
                    },
                    maxLines: 5,
                    minLines: 4,
                    controller: des,
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
                        onTap: () async {
                          if (formkey.currentState!.validate()) {
                            await FirebaseFirestore.instance
                                .collection("contact_us")
                                .add({
                              'title': title.text.trim(),
                              'description': des.text.trim(),
                              "email": FirebaseAuth.instance.currentUser!.email
                            }).then(
                              (value) => showDialog(
                                context: context,
                                builder: (context) => CustomAlertDialog(
                                  title: "send",
                                  label: "Message sent succesfully",
                                  onOk: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          }
                          title.clear();
                          des.clear();
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
