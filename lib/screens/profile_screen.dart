import 'package:cooking_social_network/screens/profile_bmi.dart';
import 'package:cooking_social_network/screens/profile_update_screen.dart';
import 'package:cooking_social_network/screens/wall.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../utils/app_styles.dart';
import '../widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Thông tin',
          style: Styles.headLineStyle3,
        ),
        centerTitle: true,
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
                const Gap(10),
                Text(
                  'Minh Nhân',
                  style: Styles.headLineStyle3.copyWith(color: Colors.black),
                ),
                Text(
                  '6051071080@st.utc2.edu.vn',
                  style:
                      Styles.headLineStyle1.copyWith(color: Styles.textColor),
                ),
                const Gap(20),
                SizedBox(
                  width: 200,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Wall(),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Styles.marinerColor,
                      ),
                      child: Center(
                        child: Text(
                          'Trang cá nhân',
                          style: Styles.headLineStyle1,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(30),
                const Divider(),
                const Gap(30),
                ProfileMenu(
                    iconLeading: Icons.settings,
                    text: 'Chỉnh sửa',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileUpdateScreen(),
                        ),
                      );
                    }),
                const Gap(30),
                ProfileMenu(
                  iconLeading: Icons.health_and_safety_sharp,
                  text: 'Chỉ số BMI của bạn',
                  onTap: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileBMI(),
                        ),
                      );},
                ),
                const Gap(30),
                ProfileMenu(
                  iconLeading: Icons.logout_outlined,
                  text: 'Đăng xuất',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
