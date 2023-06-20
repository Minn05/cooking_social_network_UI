import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:cooking_social_network/widgets/catagory.dart';
import 'package:cooking_social_network/widgets/widget_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/circle_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Cooking Social NetWork',
          style: Styles.headLineStyle3,
        ),
        actions: [
          //Notifictions
          CircleButton(
            icon: CupertinoIcons.bell,
            onPressed: () => print('bell'),
          ),
        ],
      ),
      body: ListView(
        // child: Column(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          const Gap(10),
          Text(
            'Bạn muốn cùng nấu món gì nào?',
            style: Styles.headLineStyle1
                .copyWith(color: Styles.textColor, fontSize: 20),
          ),
          const Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  // physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Catogory(),
                      Catogory(),
                      Catogory(),
                      Catogory(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Post(),
        ],
      ),
    );
  }
}
