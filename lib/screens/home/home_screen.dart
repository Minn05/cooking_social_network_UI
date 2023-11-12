import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:cooking_social_network/widgets/catagory.dart';
import 'package:cooking_social_network/widgets/widget_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.bgColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Cooking Social NetWork',
            style: Styles.headLineStyle3,
          ),
          actions: [
            IconButton(
              icon: const Icon(CupertinoIcons.bell),
              iconSize: 30.0,
              color: Colors.black.withAlpha(400),
              onPressed: () {
                print('bell pressed');
              },
            ),
          ],
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Bạn muốn cùng nấu món gì nào?',
                style: Styles.headLineStyle1
                    .copyWith(color: Styles.textColor, fontSize: 20),
              ),
              const Catogory(),
              const Gap(15),
              const Post(),
              const Gap(15),
              const Post(),
              const Gap(15),
              const Post(),
              const Gap(15),
              const Post(),
            ],
          ),
        ),
      ),
    );
  }
}
