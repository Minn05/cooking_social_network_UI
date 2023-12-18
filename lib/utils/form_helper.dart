import 'package:flutter/material.dart';

class FormHelper {
  static Widget inputFieldWidget(BuildContext context, Icon icon,
      String keyName, String labelName, Function onValidate, Function onSaved,
      {String initialValue = "", obscureText: false, Widget? suffixIcon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        initialValue: initialValue,
        key: Key(keyName),
        obscureText: obscureText,
        validator: (val) {
          return onValidate(val);
        },
        onSaved: (val) {
          return onSaved(val);
        },
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          hintText: labelName,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 30),
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).primaryColor),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }

  static Widget inputTextFieldWidget(
    BuildContext context,
    String keyName,
    String labelName,
    Function onValidate,
    Function onSaved, {
    String initialValue = "",
    obscureText: false,
  }) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          maxLines: null,
          initialValue: initialValue,
          key: Key(keyName),
          obscureText: obscureText,
          validator: (val) {
            return onValidate(val);
          },
          onSaved: (val) {
            return onSaved(val);
          },
          style: const TextStyle(fontSize: 23),
          decoration: InputDecoration(
            hintStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            hintText: labelName,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.3),
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.3),
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget saveButton(
    String buttonText,
    Function onTap,
  ) {
    return Container(
      height: 50,
      width: 150,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 1,
            ),
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget nextButton(
    String buttonText,
    Function onTap,
  ) {
    return Container(
      height: 50,
      width: 150,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 1,
            ),
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void showMessage(
    BuildContext context,
    String title,
    String message,
    String buttonText,
    Function onPressed,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () {
                    return onPressed();
                  },
                  child: Text(buttonText),
                ),
              ]);
        });
  }
}
