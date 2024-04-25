import 'package:cal_ads/utils/color_constant.dart';
import 'package:cal_ads/utils/options.dart';
import 'package:cal_ads/view/Adv_with_free_water/adv_with_free_water.dart';
import 'package:cal_ads/view/billboard_in_mall/billboard_in_mall.dart';
import 'package:cal_ads/view/normal_billboard_screen/normal_billboard_screen.dart';
import 'package:cal_ads/view/taxi_top_media/taxi_top_media.dart';
import 'package:cal_ads/view/vechile_adv/vechile_adv.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> adOption = [
    const NormalBillboardScreen(),
    const TaxiTopMedia(),
    const BillBoardInMall(),
    const AdvWithFreeWater(),
    const VechileAdv(),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: Colorconstant.primerycolor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 71),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Types Of Ads',
                  style: GoogleFonts.lindenHill(
                    fontSize: 35,
                    color: Colorconstant.secondarycolor,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Wrap(
                    spacing: 49,
                    runSpacing: 50,
                    children: List.generate(
                      Options.types.length,
                      (index) => InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => adOption[index]);
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colorconstant.secondarycolor,
                          child: SizedBox(
                            width: 189,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, bottom: 10, left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                      color: Colorconstant.primerycolor,
                                      fit: BoxFit.cover,
                                      height: 80,
                                      width: 80,
                                      image: AssetImage(
                                          Options.types[index]["imageurl"]!)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    Options.types[index]["title"]!,
                                    style: GoogleFonts.lindenHill(
                                        fontSize: 20,
                                        color: Colorconstant.primerycolor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
