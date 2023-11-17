import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TestImagePicker extends StatefulWidget {
  const TestImagePicker({Key? key}) : super(key: key);

  @override
  State<TestImagePicker> createState() => _TestImagePickerState();
}

class _TestImagePickerState extends State<TestImagePicker> {
  String? selectedImagePath;
  bool hasImage = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showImagePickerOption(context);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.grey),
        height: MediaQuery.of(context).size.height * 0.4,
        width: double.infinity,
        child: selectedImagePath == null
            ? const Icon(
                Icons.add_a_photo_outlined,
                size: 150,
                color: Colors.red,
              )
            : Image.file(
                File(selectedImagePath!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      //todo
                      selectImageFromGallery();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 70,
                          ),
                          Text('Gallery'),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      selectImageFromCamera();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 70,
                          ),
                          Text('Camera'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String?> selectImageFromGallery() async {
    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 10,
    );
    if (file != null) {
      return file.path;
    } else {
      return null;
    }
  }

  Future<String?> selectImageFromCamera() async {
    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 10,
    );
    if (file != null) {
      return file.path;
    } else {
      return null;
    }
  }
}
