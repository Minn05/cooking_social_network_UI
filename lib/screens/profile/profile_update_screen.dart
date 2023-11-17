import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../utils/app_styles.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  Uint8List? _image;
  File? selectedImage;
  final _fullname = TextEditingController();
  final _email = TextEditingController();

  final _date = TextEditingController();
  final _indexBMIController = TextEditingController();

  // List<bool> checkboxes = [false, false, false];
  bool male = false;
  bool female = false;
  bool other = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.bgColor,
        shadowColor: Styles.bgColor,
        title: const Text(
          'Details Profile',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(); // Quay lại trang trước đó
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.red,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.red,
            ),
            onPressed: () {
              //TODO:
            },
          )
        ],
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
                      bottom: -5,
                      right: -5,
                      child: IconButton(
                        onPressed: () {
                          showImagePickerOption(context);
                        },
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Gap(AppLayout.getHeight(50)),

              //fullName
              TextField(
                controller: _fullname,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Your Full Name",
                  suffixIcon: IconButton(
                      onPressed: () {
                        //todo
                        _fullname.clear();
                      },
                      icon: const Icon(Icons.clear)),
                ),
              ),

              Gap(AppLayout.getHeight(20)),

              //Email
              TextField(
                controller: _email,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Your Email",
                  suffixIcon: IconButton(
                      onPressed: () {
                        //todo
                        _email.clear();
                      },
                      icon: const Icon(Icons.clear)),
                ),
              ),

              Gap(AppLayout.getHeight(20)),

              // //Password
              // TextField(
              //   controller: _password,
              //   decoration: InputDecoration(
              //     border: const OutlineInputBorder(),
              //     hintText: "Your Email",
              //     suffixIcon: IconButton(
              //         onPressed: () {
              //           //todo
              //           _password.dispose();
              //         },
              //         icon: const Icon(Icons.remove_red_eye_sharp)),
              //   ),
              // ),

              Gap(AppLayout.getHeight(20)),

              //Gender
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your gender"),
                  Gap(AppLayout.getWidth(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          title: Text('Male'),
                          contentPadding: EdgeInsets.zero,
                          value: male,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {
                            setState(() {
                              male = value!;
                              if (value) {
                                // Nếu chọn male, bỏ chọn female và other
                                female = false;
                                other = false;
                              }
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          title: Text('Female'),
                          contentPadding: EdgeInsets.zero,
                          value: female,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {
                            setState(() {
                              female = value!;
                              if (value) {
                                // Nếu chọn female, bỏ chọn male và other
                                male = false;
                                other = false;
                              }
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          title: Text('Other'),
                          contentPadding: EdgeInsets.zero,
                          value: other,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {
                            setState(() {
                              other = value!;
                              if (value) {
                                // Nếu chọn other, bỏ chọn male và female
                                male = false;
                                female = false;
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Gap(AppLayout.getHeight(20)),

              //Age
              TextField(
                controller: _date,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.calendar_today_rounded,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 10, color: Colors.blueAccent),
                  ),
                  label: Text("Selected date"),
                ),
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2024));
                  if (pickeddate != null) {
                    setState(() {
                      _date.text = DateFormat('yyyy/MM/dd').format(pickeddate);
                    });
                  }
                },
              ),

              Gap(AppLayout.getHeight(20)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Height
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Your Height'),
                      Gap(AppLayout.getHeight(10)),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextField(
                              controller: _indexBMIController,
                              decoration: InputDecoration(
                                hintText: "Your Height",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //Weight
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Your Weight'),
                      Gap(AppLayout.getHeight(10)),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextField(
                              controller: _indexBMIController,
                              decoration: InputDecoration(
                                hintText: "Your Weight",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //BMI
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Your BMI'),
                      Gap(AppLayout.getHeight(10)),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextField(
                              controller: _indexBMIController,
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.all(0)
                                hintText: "Your BMI",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              Gap(AppLayout.getHeight(40)),

              //Update
              ElevatedButton(
                onPressed: () {
                  // Thực hiện hành động xác nhận cập nhật thông tin
                  print('Cập nhật thông tin');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Styles.marinerColor,
                  padding: const EdgeInsets.all(20), // Kích thước của button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Update',
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
          height: MediaQuery.of(context).size.height * 0.2,
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
                      _pickImageFromCamera();
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
