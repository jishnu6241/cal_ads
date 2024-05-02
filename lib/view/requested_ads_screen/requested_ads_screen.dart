import 'dart:io';
import 'dart:typed_data';
import 'package:cal_ads/utils/color_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestedAds extends StatelessWidget {
  const RequestedAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('user_ads')
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "error",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.red),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.done ||
                snapshot.connectionState == ConnectionState.active) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  var doc = snapshot.data!.docs[index].data();
                  return BillboardCard(
                    data: doc,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: snapshot.data!.docs.length,
              );
            } else {
              return Center(
                child: Text(
                  "No data",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.red),
                ),
              );
            }
          }),
    );
  }
}

class BillboardCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const BillboardCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: Colorconstant.tertiarycolor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data['billboard_type'],
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
                      data['status'],
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
                  data['duration'],
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colorconstant.primerycolor,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomImageViewer(
                        src: data['image'],
                      ),
                    );
                  },
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
                  data['location'],
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colorconstant.primerycolor,
                  ),
                ),
                Text(
                  data['price'].toString(),
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
              data['suggestion'],
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colorconstant.primerycolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomImageViewer extends StatelessWidget {
  final double height, width;
  final Uint8List src;
  const CustomImageViewer({
    super.key,
    this.height = 400,
    this.width = 400,
    required this.src,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Image.memory(
        src,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
