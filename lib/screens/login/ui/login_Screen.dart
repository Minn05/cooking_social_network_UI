import 'package:cooking_social_network/screens/login/model/login_request_model.dart';
import 'package:cooking_social_network/screens/login/services/api_service.dart';
import 'package:cooking_social_network/screens/login/ui/progressHUD.dart';
import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:cooking_social_network/utils/form_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool hidePassword = true;
  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        key: _scaffoldKey,
        body: ProgressHUD(
          child: _loginUISetup(context),
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
        ),
      ),
    );
  }

  Widget _loginUISetup(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Form(
          child: _loginUI(context),
          key: _globalFormKey,
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.redAccent,
                  Colors.redAccent,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    "https://i1.sndcdn.com/avatars-000054719474-xqwe23-t240x240.jpg",
                    fit: BoxFit.contain,
                    width: 140,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 10,
              ),
              child: Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          //email
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.verified_user),
              "email",
              "Email",
              (onVaidateVal) {
                if (onVaidateVal.isEmpty) {
                  return 'UserName can\'t be empty.';
                }
                return null;
              },
              (onSavedValue) {
                email = onSavedValue.trim();
              },
            ),
          ),
          //password
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 10,
            ),
            child: FormHelper.inputFieldWidget(
                context, const Icon(Icons.lock), "password", "Password",
                (onVaidateVal) {
              if (onVaidateVal.isEmpty) {
                return 'Password can\'t be empty.';
              }
              return null;
            }, (onSavedValue) {
              password = onSavedValue.trim();
            },
                initialValue: "",
                obscureText: hidePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility),
                  color: Colors.redAccent.withOpacity(0.4),
                )),
          ),

          Gap(AppLayout.getHeight(20)),
          //loginbutton
          Center(
            child: FormHelper.saveButton(
              "Login",
              () {
                if (validateAndSave()) {
                  print("Email: $email");
                  print("Password: $password");

                  setState(() {
                    this.isApiCallProcess = false;
                  });
                  print("1");
                  print("Email: $email");
                  print("Password: $password");

                  LoginRequestModel model = LoginRequestModel(
                    email: email,
                    password: password,
                  );
                  print("2");
                  print("Email: $email");
                  print("Password: $password");
                  APIService.login(model).then((response) => {
                        setState(() {
                          this.isApiCallProcess = false;
                        }),
                        if (response)
                          {
                            Navigator.pushNamed(
                              context,
                              '/bottombar',
                            ),
                          }
                        else
                          {
                            FormHelper.showMessage(context, Config.appName,
                                "Invalid Email or Password!", "OK", () {
                              Navigator.pop(context);
                            })
                          }
                      });
                }
              },
            ),
          ),
          Gap(AppLayout.getHeight(20)),
          const Center(
            child: Text(
              "OR",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),

          //Move to the RegisterScreen
          Center(
            child: RichText(
              text: TextSpan(
                text: 'Haven\'t account ',
                style: TextStyle(color: Colors.grey, fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, '/register');
                      },
                  ),
                ],
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
}
