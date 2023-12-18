import 'dart:io';
import 'dart:typed_data';
import 'package:cooking_social_network/screens/add_recipe/model/create_recipe_request_model.dart';
import 'package:cooking_social_network/services/api_service.dart';
import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:cooking_social_network/utils/form_helper.dart';
import 'package:cooking_social_network/widgets/progressHUD.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config.dart';
import '../../../utils/app_styles.dart';

class AddScren extends StatefulWidget {
  const AddScren({super.key});

  @override
  State<AddScren> createState() => _AddScrenState();
}

class _AddScrenState extends State<AddScren> {
  static final _scaffoldKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  static final _formKeyI = GlobalKey<FormState>();
  static final _formKeyS = GlobalKey<FormState>();
  File? selectedImage;
  Uint8List? _image;
  String nameOfRecipe = "";
  String description = "";
  String typeOfRecipe = "";
  String? caloriesIndex;
  String mealPortion = "";
  String preTime = "";
  bool hasImage = false;
  bool isApiCallProcess = false;
  final List<String> caloriesList = [
    '0-200',
    '200-400',
    '400-600',
    '600-800',
    '800-1000',
    '1000-1500',
    '1500-2000',
  ];
  final List<TextEditingController> _itemIngredients = [];
  final List<TextEditingController> _itemSteps = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addFieldIngredients();
      _addFieldSteps();
    });
  }

  _addFieldIngredients() {
    setState(() {
      _itemIngredients.add(TextEditingController());
    });
  }

  _addFieldSteps() {
    setState(() {
      _itemSteps.add(TextEditingController());
    });
  }

  _removeItemIngredients(i) {
    setState(() {
      _itemIngredients.removeAt(i);
    });
  }

  _removeItemFieldSteps(i) {
    setState(() {
      _itemSteps.removeAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade100,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
            child: Row(
              children: [
                FormHelper.saveButton(
                  "Create",
                  () {
                    if (validateAndSave()) {
                      setState(() {
                        this.isApiCallProcess = true;
                      });

                      var ingredients = _itemIngredients
                          .map((item) => item.text.trim())
                          .toList();
                      var steps =
                          _itemSteps.map((item) => item.text.trim()).toList();

                      CreateRecipeRequestModel model = CreateRecipeRequestModel(
                        image: _image.toString(),
                        nameOfRecipe: nameOfRecipe,
                        description: description,
                        typeOfRecipe: typeOfRecipe,
                        mealPortion: mealPortion,
                        preTime: preTime,
                        calories: caloriesIndex,
                        ingredients: ingredients,
                        step: steps,
                      );

                      APIService.createRecipe(model).then(
                          (response) => {
                                setState(
                                  () {
                                    this.isApiCallProcess = false;
                                  },
                                ),
                                if (response)
                                  {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/bottombar', (route) => false)
                                  }
                                else
                                  {
                                    print("Error"),
                                    FormHelper.showMessage(
                                      context,
                                      Config.appName,
                                      "Complete all of your recipe information! ",
                                      "OK",
                                      () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  },
                              },
                          // ignore: argument_type_not_assignable_to_error_handler
                          onError: (err) => {print(err)});
                    }
                  },
                ),
                Gap(AppLayout.getWidth(8)),
                IconButton(
                    onPressed: () {
                      print('Deleted Reicpe');
                    },
                    icon: const Icon(Icons.delete, color: Colors.redAccent))
              ],
            ),
          ),
        ],
      ),
      body: ProgressHUD(
          child: _addRecipeUISetUp(context),
          inAsyncCall: isApiCallProcess,
          opacity: 0.3),
    ));
  }

  Widget _addRecipeUISetUp(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Form(
          child: _addRecipe(context),
          key: _globalFormKey,
        ),
      ),
    );
  }

  Widget _addRecipe(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //Add image to tho recipe
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () async {
                  showImagePickerOption(context);
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade200),
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: double.infinity,
                    child: _image != null
                        ? Image.file(
                            File(_image!.toString()),
                            fit: BoxFit.cover,
                          )
                        : const Icon(
                            Icons.add_a_photo_outlined,
                            size: 150,
                            color: Colors.redAccent,
                          )

                    // Image.file(
                    //     File(_image!),
                    //     fit: BoxFit.cover,
                    //   ),

                    ),
              ),
            ),
          ),

          //decription
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FormHelper.inputTextFieldWidget(
              context,
              "nameOfRecipe",
              "Tên Món ăn",
              (onVaidateVal) {
                if (onVaidateVal.isEmpty) {
                  return 'Recipe Name can\'t be empty.';
                }
                return null;
              },
              (onSavedValue) {
                print("210==============> $onSavedValue");
                nameOfRecipe = onSavedValue.trim();
              },
            ),
          ),

          Gap(AppLayout.getHeight(5)),
          //Inspiration
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FormHelper.inputTextFieldWidget(
              context,
              "decription",
              "Mô tả về món ăn của bạn",
              (onVaidateVal) {
                if (onVaidateVal.isEmpty) {
                  return 'Recipe Name can\'t be empty.';
                }
                return null;
              },
              (onSavedValue) {
                description = onSavedValue.trim();
              },
            ),
          ),
          const Gap(5),

          //Thể loại
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FormHelper.inputTextFieldWidget(
              context,
              'typeOfRecipe',
              'Thể loại',
              (onVaidateVal) {
                if (onVaidateVal.isEmpty) {
                  return 'Recipe Name can\'t be empty.';
                }
                return null;
              },
              (onSavedValue) {
                print(onSavedValue);
                typeOfRecipe = onSavedValue.trim();
              },
            ),
          ),

          const Gap(5),
          //mealPortion
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FormHelper.inputTextFieldWidget(
              context,
              'mealPortion',
              'Khẩu phần',
              (onVaidateVal) {
                if (onVaidateVal.isEmpty) {
                  return 'Recipe name can\'t be empty.';
                }
                return null;
              },
              (onSavedValue) {
                mealPortion = onSavedValue.trim();
              },
            ),
          ),

          const Gap(5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FormHelper.inputTextFieldWidget(
              context,
              'preTime',
              'Thời gian nấu',
              (onVaidateVal) {
                if (onVaidateVal.isEmpty) {
                  return 'Pretime can\'t be empty.';
                }
                return null;
              },
              (onSavedValue) {
                preTime = onSavedValue.trim();
              },
            ),
          ),
          Gap(AppLayout.getHeight(5)),

          //calories
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  'Số Calo của món ăn',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: caloriesList
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ))
                    .toList(),
                value: caloriesIndex,
                onChanged: (String? value) {
                  setState(() {
                    caloriesIndex = value;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  elevation: 0,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.redAccent.withOpacity(0.3), width: 2)),
                ),
                dropdownStyleData: DropdownStyleData(
                  elevation: 2,
                  maxHeight: null,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.redAccent.withOpacity(0.3), width: 2)),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(4),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
              ),
            ),
          ),

          const Gap(5),
          //Ingredients
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: Colors.white),
              child: Form(
                key: _formKeyI,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Text(
                        'Nguyên liệu',
                        style: Styles.headLineStyle3
                            .copyWith(color: Colors.black54),
                      ),
                    ),
                    const Divider(height: 2),
                    Gap(AppLayout.getHeight(10)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < _itemIngredients.length; i++)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Center(
                                      child: Text(
                                    "${i + 1}.",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ))),

                              Expanded(
                                flex: 8,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: TextFormField(
                                    controller: _itemIngredients[i],
                                    validator: (value) {
                                      if (value == "") {
                                        return "Please Enter Ingredient";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: ('Nguyên liệu'),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.3),
                                          width: 2,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.3),
                                          width: 2,
                                        ),
                                      ),
                                      hintStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    _removeItemIngredients(i);
                                  },
                                  child: const Icon(Icons.remove),
                                ),
                              )
                              // Divider(
                              //   height: 1,
                              //   thickness: 1,
                              // ),
                            ],
                          ),
                      ],
                    ),
                    const Divider(height: 2),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _addFieldIngredients();
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Create'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Gap(10),
          //Steps
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: Colors.white),
              child: Form(
                key: _formKeyS,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Text(
                        'Bước làm',
                        style: Styles.headLineStyle3
                            .copyWith(color: Colors.black54),
                      ),
                    ),
                    const Divider(height: 2),
                    Gap(AppLayout.getHeight(10)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < _itemSteps.length; i++)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Center(
                                      child: Text(
                                    "${i + 1}.",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ))),

                              Expanded(
                                flex: 8,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: TextFormField(
                                    controller: _itemSteps[i],
                                    validator: (value) {
                                      if (value == "") {
                                        return "Please Enter item Name";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: ('Bước làm'),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.3),
                                          width: 2,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.3),
                                          width: 2,
                                        ),
                                      ),
                                      hintStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    _removeItemFieldSteps(i);
                                  },
                                  child: const Icon(Icons.remove),
                                ),
                              )
                              // Divider(
                              //   height: 1,
                              //   thickness: 1,
                              // ),
                            ],
                          ),
                      ],
                    ),
                    const Divider(height: 2),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _addFieldSteps();
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Create'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = _globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    // Select image from gallery
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
                InkWell(
                  onTap: () {
                    // Select image from camera
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
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String?> selectImageFromGallery() async {
    final returnImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 10,
    );
    if (returnImage == null) return null;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  Future<String?> selectImageFromCamera() async {
    final returnImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 10,
    );
    if (returnImage == null) return null;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
