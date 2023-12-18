import 'package:cooking_social_network/widgets/progressHUD.dart';
import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../config.dart';
import '../../../services/api_service.dart';
import '../../../utils/form_helper.dart';
import '../../bottombar/bottom_bar.dart';
import '../model/register_request_model.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
  int _activeStepIndex = 0;
  final _fullname = TextEditingController();
  bool male = false;
  bool female = false;
  bool other = false;
  final _date = TextEditingController();
  final _weight = TextEditingController();
  final _height = TextEditingController();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Stepper to Login"),
        ),
        backgroundColor: Colors.grey.shade200,
        key: _scaffoldKey,
        body: ProgressHUD(
          child: _stepperUISetup(context),
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
        ),
      ),
    );
  }

  Widget _stepperUISetup(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Form(
          child: _stepperUI(context),
          key: _globalFormKey,
        ),
      ),
    );
  }

  Widget _stepperUI(BuildContext context) {
    return Stepper(
      controlsBuilder: _controllerBuilder,
      type: StepperType.vertical,
      currentStep: _activeStepIndex,
      steps: stepList(),
      onStepContinue: () {
        if (_activeStepIndex < (stepList().length - 1)) {
          _activeStepIndex += 1;
        } else {
          setState(() {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomBar(),
              ),
            );
          });
        }
        setState(() {});
      },
      onStepCancel: () {
        if (_activeStepIndex == 0) return;
        _activeStepIndex -= 1;
        setState(() {});
      },
    );
  }

  List<Step> stepList() => [
        //fullname
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text("Step 1"),
          content: Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _fullname,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Enter Your Fullname",
                suffixIcon: IconButton(
                    onPressed: () {
                      //todo
                      _fullname.clear();
                    },
                    icon: const Icon(Icons.clear)),
              ),
            ),
          ),
        ),
        //Gender
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text("Step 2"),
          content: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Your gender"),
              Gap(AppLayout.getWidth(20)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckboxListTile(
                    title: const Text('Male'),
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
                  CheckboxListTile(
                    title: const Text('Female'),
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
                  CheckboxListTile(
                    title: const Text('Other'),
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
                ],
              ),
            ],
          ),
        ),
        //Age
        Step(
          state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text("Step 3"),
          content: Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
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
          ),
        ),

        //Height & Weight
        Step(
          state: StepState.complete,
          isActive: _activeStepIndex >= 3,
          title: const Text("Step 4"),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Height
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Your Height'),
                    Gap(AppLayout.getHeight(10)),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextField(
                            controller: _height,
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
              ),
              //Weight
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Your Weight'),
                    Gap(AppLayout.getHeight(10)),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextField(
                            controller: _weight,
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
              ),
            ],
          ),
        ),
      ];

  Widget _controllerBuilder(context, details) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: () {
            details.onStepCancel;
            setState(() {
              if (validateAndSave()) {
                  // print("Fullname: $fullName");
                  // print("Email: $email");
                  // print("Password: $password");

                  setState(() {
                    this.isApiCallProcess = true;
                  });

                  // Navigator.pushNamed(context, '/stepper');

                  RegisterRequestModel model = RegisterRequestModel(
                    // fullName: fullName,
                    // email: email,
                    // password: password,
                  );
                  APIService.register(model).then((response) => {
                        setState(() {
                          this.isApiCallProcess = false;
                        }),
                        if (model != null)
                          {
                            FormHelper.showMessage(context, Config.appName,
                                'true: ${response.user}', 'OKE', () {
                              Navigator.pop(context);
                            }),
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/stepper',
                              (route) => true,
                            ),
                          }
                        else
                          {
                            FormHelper.showMessage(context, Config.appName,
                                'false: ${response.msg}', "OK", () {
                              Navigator.pop(context);
                            })
                          }
                      });
                }
              },
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text('Back'),
          ),
        ),
        Gap(AppLayout.getWidth(10)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: () {
            details.onStepContinue;
            setState(() {});
          },
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text('Next'),
          ),
        ),
      ],
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

  bool backAndReset() {
    final form = _globalFormKey.currentState;
    if (form != null) {
      form.reset();
      return true;
    }
    return false;
  }
}
