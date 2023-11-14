import 'package:cooking_social_network/screens/profile/profile_update_screen.dart';
import 'package:cooking_social_network/screens/profile/tabbar_screen.dart/tabbar_post.dart';
import 'package:cooking_social_network/screens/profile/tabbar_screen.dart/tabbar_save.dart';
import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../utils/app_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.bgColor,
        shadowColor: Styles.bgColor,
        elevation: 0,
        leading: const Icon(
          Icons.abc,
          color: Colors.red,
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.sunny, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: Styles.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.asset('assets/images/avt.jpg'),
                    ),
                  ),
                  Gap(AppLayout.getWidth(15)),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Minh Nhân'),
                            Text("6051071080@st.utc2.edu.vn"),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //todo
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProfileUpdateScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                              side:
                                  const BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "Edit",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Gap(AppLayout.getHeight(10)),

              const Divider(
                height: 3,
                color: Colors.grey,
              ),
              Gap(AppLayout.getHeight(10)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Followers
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: InkWell(
                      onTap: () {
                        // todo
                      },
                      child: const Column(
                        children: [
                          Text('0'),
                          Text('Followers'),
                        ],
                      ),
                    ),
                  ),

                  // verticalDivider
                  Container(
                    height: 60,
                    width: 1,
                    color: Colors.grey,
                  ),

                  // Following
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                    child: InkWell(
                      onTap: () {
                        // todo
                      },
                      child: const Column(
                        children: [
                          Text('0'),
                          Text('Following'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // ),

              const Divider(
                height: 3,
                color: Colors.grey,
              ),

              Gap(AppLayout.getHeight(10)),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          // color: Colors.green,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: TabBar(
                            // unselectedLabelColor: Colors.blue,
                            labelColor: Colors.black,
                            indicatorColor:
                                Colors.amberAccent, //màu của thanh dưới
                            indicatorWeight: 5, //độ dày của thanh
                            // indicator: BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: BorderRadius.circular(5),
                            // ),
                            controller: tabController,
                            tabs: const [
                              Tab(
                                text: "Your Recipe",
                              ),
                              Tab(
                                text: "Recipe Is Saved",
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: const [
                            TabBar_Post(),
                            TabBar_Save(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
