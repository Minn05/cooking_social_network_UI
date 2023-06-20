import 'package:cooking_social_network/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_styles.dart';

class MyContainer {
  final String id;
  final Widget content;

  MyContainer({required this.id, required this.content});
}

class AddSteps extends StatefulWidget {
  const AddSteps({
    super.key,
  });

  @override
  State<AddSteps> createState() => _AddStepsState();
}

class _AddStepsState extends State<AddSteps> {
  bool showAddSteps = false;
  List<MyContainer> addedContainers = [];

  void _removeContainer(String id) {
    setState(() {
      addedContainers.removeWhere((container) => container.id == id);
      print('id= $id');
      _updateStepNumbers();
    });
  }

  void _updateStepNumbers() {
    //  print('id2 = $id');
    for (int i = 0; i < addedContainers.length; i++) {
      final MyContainer container = addedContainers[i];
      print('container.id = ${addedContainers[i].id}');
      final Container containerWidget = container.content as Container;
      final Padding paddingWidget = containerWidget.child as Padding;
      final Row row = paddingWidget.child as Row;
      final Text textWidget = row.children[0] as Text;
      final String newText = '${i + 1}.';
      final Text updatedTextWidget = Text(
        newText,
        style: textWidget.style,
      );
      row.children[0] = updatedTextWidget;
    }
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
              'Bước làm',
              style: Styles.headLineStyle3.copyWith(color: Colors.black),
            ),
            const Gap(30),

            // Added containers
            //...addedContainers,
            // const Divider(),
            // const Gap(30),
            // TextButton(
            //   onPressed: () {
            //     setState(() {
            //       showAddSteps = true;
            //       final String id = UniqueKey().toString();
            //       // addedContainers.add(Container(
            //       //   child: Padding(
            //       //     padding: const EdgeInsets.only(bottom: 20),
            //       //     child: Row(
            //       //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       //       crossAxisAlignment: CrossAxisAlignment.start,
            //       //       children: [
            //       //         Text(
            //       //           '${addedContainers.length + 1}.', // Hiển thị số thứ tự
            //       //           style: TextStyle(
            //       //             fontSize: 16,
            //       //             fontWeight: FontWeight.bold,
            //       //           ),
            //       //         ),
            //       //         TextInput(
            //       //           width: MediaQuery.of(context).size.width - 90,
            //       //           hint: 'Các bước nấu để nấu món của bạn\n\n\n',
            //       //           icon: null,
            //       //           inputAction: TextInputAction.send,
            //       //           inputType: TextInputType.text,
            //       //           //height: 30,
            //       //         ),
            //       //         IconButton(
            //       //           onPressed: () => _removeContainer(id), //
            //       //           icon: Icon(
            //       //             Icons.close,
            //       //             size: 30,
            //       //             color: Styles.textColor,
            //       //           ),
            //       //         ),
            //       //       ],
            //       //     ),
            //       //   ),
            //       // ));
            //       // _updateStepNumber();
            //     });
            //   },
            // Render added containers
            for (final container in addedContainers) ...[
              container.content,
              const Divider(),
            ],

            const Gap(30),
            TextButton(
              onPressed: () {
                setState(() {
                  showAddSteps = true;
                  final String id = UniqueKey().toString();
                  addedContainers.add(MyContainer(
                    id: id,
                    content: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${addedContainers.length + 1}.', // Hiển thị số thứ tự
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextInput(
                              width: MediaQuery.of(context).size.width - 90,
                              hint: 'Các bước nấu để nấu món của bạn\n\n\n',
                              icon: null,
                              inputAction: TextInputAction.send,
                              inputType: TextInputType.text,
                            ),
                            IconButton(
                              onPressed: () => _removeContainer(id),
                              icon: Icon(
                                Icons.close,
                                size: 30,
                                color: Styles.textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
                  _updateStepNumbers();
                });
              },
              child: Center(
                child: Text(
                  '+ Bước',
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
