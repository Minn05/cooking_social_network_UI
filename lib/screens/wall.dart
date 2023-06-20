import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:flutter/material.dart';

class Wall extends StatelessWidget {
  const Wall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar:AppBar(
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
          'Trang cá nhân',
          style: Styles.headLineStyle3,
        ),
      ) ,
      // body: ,
    );
  }
}