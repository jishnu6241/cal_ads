import 'package:cal_ads/utils/color_constant.dart';
import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
    required this.dataList,
    required this.label,
    this.onSelected,
  });
  final String label;
  final List<String> dataList;
  final Function(String?)? onSelected;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      enableSearch: false,
      width: 360,
      hintText: label,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colorconstant.tertiarycolor,
      ),
      menuStyle: MenuStyle(
        backgroundColor: MaterialStatePropertyAll(
          Colorconstant.secondarycolor,
        ),
      ),
      textStyle: TextStyle(color: Colorconstant.primerycolor),
      onSelected: onSelected,
      dropdownMenuEntries: List.generate(
        dataList.length,
        (index) => DropdownMenuEntry(
          value: dataList[index],
          label: dataList[index],
        ),
      ),
    );
  }
}
