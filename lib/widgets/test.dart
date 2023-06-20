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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.shade800,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedImagePath == null
                ? Image.asset(
                    'assets/images/image_placeholder.png',
                    height: 200,
                    width: 200,
                    fit: BoxFit.fill,
                  )
                : Image.file(
                    File(selectedImagePath!),
                    height: 200,
                    width: 200,
                    fit: BoxFit.fill,
                  ),
            const Text(
              'Select Image',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: const EdgeInsets.all(20),
                textStyle: const TextStyle(fontSize: 14, color: Colors.white),
              ),
              onPressed: () async {
                selectImage();
              },
              child: const Text('Select'),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Future<void> selectImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Text(
                    'Select Image From!',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          selectedImagePath = await selectImageFromGallery();
                          print('Image_Path:-');
                          print(selectedImagePath);
                          if (selectedImagePath != null) {
                            Navigator.pop(context);
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("No Image Selected!"),
                              ),
                            );
                          }
                        },
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/gallery.png',
                                  height: 60,
                                  width: 60,
                                ),
                                const Text('Gallery'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          selectedImagePath = await selectImageFromCamera();
                          print('Image_Path:-');
                          print(selectedImagePath);

                          if (selectedImagePath != null) {
                            Navigator.pop(context);
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("No Image Captured!"),
                              ),
                            );
                          }
                        },
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/camera.png',
                                  height: 60,
                                  width: 60,
                                ),
                                const Text('Camera'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
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
