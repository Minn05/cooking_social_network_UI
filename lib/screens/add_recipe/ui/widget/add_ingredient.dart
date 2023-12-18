import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../utils/app_styles.dart';
import 'text_input.dart';

class AddIngredient extends StatefulWidget {
  const AddIngredient({
    super.key,
  });

  @override
  State<AddIngredient> createState() => _AddIngredientState();
}

class _AddIngredientState extends State<AddIngredient> {
  bool showAddIngredient = false;
  List<Widget> addedContainers = [];

  void _removeContainer(int index) {
    setState(() {
      addedContainers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nguyên liệu',
              style: Styles.headLineStyle3.copyWith(color: Colors.black),
            ),
            Gap(AppLayout.getHeight(10)),
            const Divider(
              height: 1,
            ),
            Gap(AppLayout.getHeight(20)),

            // Added containers
            ...addedContainers,
            const Divider(
              height: 1,
            ),
            Gap(AppLayout.getHeight(20)),

            TextButton(
              onPressed: () {
                setState(() {
                  showAddIngredient = true;
                  final int index = addedContainers.length;
                  addedContainers.add(Container(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextInput(
                            width: MediaQuery.of(context).size.width - 80,
                            hint: 'Nguyên liệu, số lượng',
                            icon: null,
                            inputAction: TextInputAction.send,
                            inputType: TextInputType.text,
                          ),
                          IconButton(
                            onPressed: () => _removeContainer(index), //
                            icon: Icon(
                              Icons.close,
                              size: 30,
                              color: Styles.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
                });
              },
              child: Center(
                child: Text(
                  '+ Nguyên liệu',
                  style:
                      Styles.headLineStyle1.copyWith(color: Styles.textColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
