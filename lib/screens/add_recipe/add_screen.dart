import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:cooking_social_network/widgets/add_steps.dart';
import 'package:cooking_social_network/widgets/test.dart';
import 'package:cooking_social_network/widgets/text_input.dart';
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
          title: Text('Xác nhận'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Bạn có chắc muốn đăng?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Không'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Có'),
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
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: TextButton(
                    onPressed: () {
                      _showConfirmationDialog(context);
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      backgroundColor: Styles.blueColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    child: Text(
                      'Đăng',
                      style: Styles.headLineStyle1
                          .copyWith(color: Styles.textColor),
                    ),
                  ),
                ),
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
              TestImagePicker(),

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
                      const Gap(10),
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

//Class Text and TextInput
