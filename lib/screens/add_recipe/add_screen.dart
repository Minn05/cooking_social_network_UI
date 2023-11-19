import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:cooking_social_network/widgets/add_steps.dart';
import 'package:cooking_social_network/widgets/test.dart';
import 'package:cooking_social_network/screens/add_recipe/text_input.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/add_ingredient.dart';
import '../../widgets/text_and_textinput.dart';

class AddScren extends StatelessWidget {
  const AddScren({super.key});

  // Hàm hiển thị hộp thoại xác nhận
  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bạn có chắc muốn đăng?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Không'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Có'),
              onPressed: () {
                // Thực hiện hành động khi người dùng chọn "Có"
                // ...
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.green,
                      side: const BorderSide(
                        color: Colors.yellow,
                        width: 3,
                      ),
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    _showConfirmationDialog(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Create'),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      print('Deleted Reicpe');
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.grey,
                      shadows: [Shadow(color: Colors.red)],
                    ))
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              //Add image to tho recipe
              Container(
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: TestImagePicker(),
                ),
              ),

              //decription
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      //Content
                      TextInput(
                        width: MediaQuery.of(context).size.width - 20,
                        hint: 'Tên món ăn',
                        icon: null,
                        inputAction: TextInputAction.send,
                        inputType: TextInputType.text,
                      ),
                      Gap(AppLayout.getHeight(10)),
                      //Inspiration
                      TextInput(
                        width: MediaQuery.of(context).size.width - 20,
                        hint:
                            'Hãy chia sẽ với mọi người về món này của bạn nhé. Ai đã truyền cảm hứng cho bạn để nấu nó? Bạn thích thưởng thức nó như thé nào,...',
                        icon: null,
                        inputAction: TextInputAction.send,
                        inputType: TextInputType.text,
                      ),
                      const Gap(10),
                      //Chứa tag để thực hiện đề xuất món ăn
                      const TextandTextInput(
                        text: 'Thể loại',
                        texthin: 'Thể loại',
                      ),
                      const Gap(30),
                      const TextandTextInput(
                        text: 'Khẩu phần',
                        texthin: '2 người',
                      ),
                      const Gap(30),
                      const TextandTextInput(
                        text: 'Thời gian nấu',
                        texthin: '1 tiếng 30 phút',
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(10),
              const AddIngredient(),
              const Gap(10),
              const AddSteps(),
            ],
          ),
        ],
      ),
    );
  }
}
