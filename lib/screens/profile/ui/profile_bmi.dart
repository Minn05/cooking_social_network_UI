import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/app_styles.dart';
import '../../add_recipe/ui/widget/height_weight.dart';


class ProfileBMI extends StatefulWidget {
  const ProfileBMI({super.key});

  @override
  State<ProfileBMI> createState() => _ProfileBMIState();
}

class _ProfileBMIState extends State<ProfileBMI> {
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
          'Chỉ số BMI của bạn',
          style: Styles.headLineStyle3,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: Column(
                  children: [
                    Gap(AppLayout.getHeight(40)),
                    HeightWeight(
                      text: 'Cân nặng',
                      texthin: 'kilogam',
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 40,
                      inputaction: TextInputAction.send,
                      texttype: TextInputType.text,
                    ),
                    Gap(AppLayout.getHeight(40)),
                    HeightWeight(
                      text: 'Chiều cao',
                      texthin: 'met',
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 40,
                      inputaction: TextInputAction.send,
                      texttype: TextInputType.text,
                    ),
                    Gap(AppLayout.getHeight(40)),
                    HeightWeight(
                      text: 'Chỉ số BMI của bạn',
                      texthin: '',
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 40,
                      inputaction: TextInputAction.done,
                      texttype: TextInputType.text,
                    ),
                    Gap(AppLayout.getHeight(40)),
                  ],
                ),
              ),
            ),
            Gap(AppLayout.getHeight(10)),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('sss'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
