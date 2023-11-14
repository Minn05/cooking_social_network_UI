// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/app_styles.dart';
import 'package:cooking_social_network/widgets/test.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  Uint8List? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(); // Quay lại trang trước đó
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Styles.bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 45,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                          ),
                    Positioned(
                      top: -5,
                      right: -20,
                      child: IconButton(
                        onPressed: () {
                          showImagePickerOption(context);
                        },
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(AppLayout.getHeight(30)),

              //fullName

              //Email
              //Gender
              //Age
              //Height
//Weight
//BMI
              //Update
              ElevatedButton(
                onPressed: () {
                  // Thực hiện hành động xác nhận cập nhật thông tin
                  print('Cập nhật thông tin');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Styles.marinerColor,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 24), // Kích thước của button
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Bo góc của button
                  ),
                ),
                child: Text(
                  'Cập nhật',
                  style: Styles.headLineStyle1,
                ),
              ),
            ],
          ),
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
          height: MediaQuery.of(context).size.height * 0.3,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      //todo
                      _pickImageFromGallery();
                    },
                    child: SizedBox(
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
                      _pickImageFromCamera();
                    },
                    child: SizedBox(
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

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
