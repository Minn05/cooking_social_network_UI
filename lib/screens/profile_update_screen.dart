// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:cooking_social_network/utils/app_layout.dart';

import '../utils/app_styles.dart';
import '../widgets/profile_info_text.dart';

class ProfileUpdateScreen extends StatelessWidget {
  const ProfileUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController? name = TextEditingController(text: 'Trần Minh Nhân');
    TextEditingController? email =
        TextEditingController(text: '6051071080@st.utc2.edu.vn');
    // name?.text = 'ok chuâ';
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
          'Cập nhật thông tin',
          style: Styles.headLineStyle3,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 45),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                          image: AssetImage('assets/images/avt.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(AppLayout.getHeight(30)),

                //name
                ProfileInfoText(
                  input: name,
                  labelText: 'Tên',
                  hintText: 'hintText',
                  icon: const Icon(Icons.person),
                ),
                Gap(AppLayout.getHeight(30)),

                //Email address
                ProfileInfoText(
                  input: email,
                  labelText: 'Email',
                  hintText: 'hintText',
                  icon: const Icon(Icons.email_outlined),
                ),
                Gap(AppLayout.getHeight(30)),
                //Update
                ElevatedButton(
                  onPressed: () {
                    // Thực hiện hành động xác nhận cập nhật thông tin
                    print('Cập nhật thông tin');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Styles.marinerColor,
                    padding: EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24), // Kích thước của button
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Bo góc của button
                    ),
                  ),
                  child: Text(
                    'Cập nhật',
                    style: Styles.headLineStyle1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
