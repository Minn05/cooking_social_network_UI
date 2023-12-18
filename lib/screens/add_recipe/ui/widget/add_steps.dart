import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddSteps extends StatefulWidget {
  // final String taskId;
  const AddSteps({
    super.key,
    // required this.taskId,
  });

  @override
  State<AddSteps> createState() => _AddStepsState();
}

class _AddStepsState extends State<AddSteps> {
  final List<TextEditingController> _items = [];
  final List<TextEditingController> _quantity = [];
  final List<TextEditingController> _price = [];

  double textFieldBottomPadding = 15,
      textFieldRounded = 10,
      inputFieldPadding = 2;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addField();
    });
  }

  _addField() {
    setState(() {
      _items.add(TextEditingController());
      _quantity.add(TextEditingController());
      _price.add(TextEditingController());
    });
  }

  _removeItem(i) {
    setState(() {
      _items.removeAt(i);
      _quantity.removeAt(i);
      _price.removeAt(i);
    });
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    // FormData formData = FormData.fromMap{{}};
    // for(int i = 0; i <_items.length; i++){
    //   formData.fields.add(MapEntry("items[]", _items[i].text));
    //   formData.fields.add(MapEntry("quantity[]", _quantity[i].text));
    //   formData.fields.add(MapEntry("price[]", _price[i].text));

    // }
    // networkRequest{
    //   context: context,
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.white),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text(
                  'Bước làm',
                  style: Styles.headLineStyle3.copyWith(color: Colors.black54),
                ),
              ),
              Gap(AppLayout.getHeight(10)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < _items.length; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Center(
                                child: Text(
                              "${i + 1}.",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ))),

                        Expanded(
                          flex: 8,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: TextFormField(
                              controller: _items[i],
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
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              _removeItem(i);
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
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      _addField();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Create'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                ],
              ),
              MaterialButton(
                onPressed: () {
                  _submit();
                  print("Steps: ${_items.toList()}");
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.redAccent,
                child: const Center(
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
