import 'package:cal_ads/utils/color_constant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CustomImagePickerButton extends StatefulWidget {
  final Function(PlatformFile file) onPick;
  final double height, width;
  const CustomImagePickerButton({
    super.key,
    required this.onPick,
    this.height = 100,
    this.width = 100,
  });

  @override
  State<CustomImagePickerButton> createState() =>
      _CustomImagePickerButtonState();
}

class _CustomImagePickerButtonState extends State<CustomImagePickerButton> {
  PlatformFile? _selectedFile;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: Colorconstant.secondarycolor,
      child: InkWell(
        onTap: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['jpg', 'png', 'jpeg'],
          );

          if (result != null && result.files.isNotEmpty) {
            _selectedFile = result.files.first;
            setState(() {});
            widget.onPick(result.files.first);
          }
        },
        borderRadius: BorderRadius.circular(20),
        child: _selectedFile != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.memory(
                  _selectedFile!.bytes!,
                  height: widget.height,
                  width: widget.width,
                  fit: BoxFit.cover,
                ),
              )
            : SizedBox(
                height: widget.height,
                width: widget.width,
                child: Icon(
                  Icons.add_photo_alternate_rounded,
                  color: Colorconstant.primerycolor,
                ),
              ),
      ),
    );
  }
}
