import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:cooking_social_network/utils/dotted_line.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'comment_screen.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({super.key});

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  bool isIconBookMark = false;
  bool isIconHeart = false;

  void changeIconHeart() {
    setState(() {
      //Toggle the icon state
      isIconHeart = !isIconHeart;
    });
  }

  void changeIconBookMark() {
    setState(() {
      //Toggle the icon state
      isIconBookMark = !isIconBookMark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            // Thực hiện hành động khi nút "quay lại" được nhấn
            Navigator.of(context).pop(); // Quay lại trang trước đó
          },
        ),
        centerTitle: true,
        title: Text(
          'Chi tiết công thức',
          style: Styles.headLineStyle3,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                'https://picsum.photos/400/400',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Tên món ăn',
                          style: Styles.headLineStyle3
                              .copyWith(color: Styles.textColor),
                        )
                      ],
                    ),
                    Gap(AppLayout.getHeight(15)),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.network(
                                      'https://picsum.photos/200/200',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Gap(AppLayout.getWidth(10)),
                                  Text(
                                    'John Doe',
                                    style: Styles.headLineStyle2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(isIconBookMark
                                ? FluentSystemIcons.ic_fluent_bookmark_filled
                                : FluentSystemIcons.ic_fluent_bookmark_regular),
                            onPressed: changeIconBookMark,
                          ),
                        ],
                      ),
                    ),
                    Gap(AppLayout.getHeight(20)),
                    const Divider(
                      thickness: 2,
                    ),
                    Center(
                      child: Column(children: [
                        Text(
                          'Thời gian nấu',
                          style: Styles.headLineStyle2,
                        ),
                        Gap(AppLayout.getHeight(10)),
                        Text(
                          'Khẩu phần',
                          style: Styles.headLineStyle2,
                        ),
                      ]),
                    ),
                    Gap(AppLayout.getHeight(20)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Nguyên liệu',
                              style: Styles.headLineStyle1.copyWith(
                                  color: Styles.textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        //Gap(AppLayout.getHeight(20)),
                        const VerticalTextList(
                          texts: [
                            'Cánh gà/ đùi gà',
                            'Đường/ mắm/ nước',
                            'Bơ',
                            'Tỏi'
                          ],
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        Gap(AppLayout.getHeight(20)),
                        Row(
                          children: [
                            Text(
                              'Cách làm',
                              style: Styles.headLineStyle1.copyWith(
                                  color: Styles.textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const VerticalTextList(
                          texts: [
                            'Đầu tiên áp chảo gà(không cần cho dầu)',
                            'Cho bơ vào, tỏi, rồi đến hỗn hợp mắm, nước. Cho gà vào và đun tiếp.',
                          ],
                        ),
                      ],
                    ),
                    Divider(thickness: 2),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade100,
                          shadowColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      onPressed: changeIconHeart,
                      icon: Icon(
                        isIconHeart
                            ? FluentSystemIcons.ic_fluent_heart_filled
                            : FluentSystemIcons.ic_fluent_heart_regular,
                        key: ValueKey<bool>(isIconHeart),
                        color: isIconHeart ? Colors.red : Colors.black,
                      ),
                      label: Text(
                        '3',
                        style: TextStyle(color: Styles.textColor),
                      ),
                    ),
                    Divider(thickness: 2),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Bình Luận',
                        style: Styles.headLineStyle1
                            .copyWith(color: Styles.textColor),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommentScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VerticalTextList extends StatelessWidget {
  final List<String> texts;

  const VerticalTextList({Key? key, required this.texts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < texts.length; i++) ...[
          ListTile(
            title: Text(
              texts[i],
              style: Styles.headLineStyle2,
            ),
          ),
          if (i < texts.length - 1) DotLine(),
        ],
      ],
    );
  }
}
