import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerOptionWidget extends StatelessWidget {
  final onTap;
  const ImagePickerOptionWidget({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Choose an option",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Gallery'),
            onTap: () {
              onTap(ImageSource.gallery);
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: () {
              onTap(ImageSource.camera);
            },
          ),
        ],
      ),
    );
  }
}
