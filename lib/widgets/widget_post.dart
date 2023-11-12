import 'package:cooking_social_network/screens/home/recipe_details.dart';
import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  //Initial state of the icon
  bool isIconHeart = false;
  bool isIconBookMark = false;

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
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.3,
            ),
          ],
        ),
        child: Column(
          children: [
            //Information
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.red,
                            child: ClipOval(
                              child: Image.network(
                                'https://picsum.photos/200/200',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Gap(AppLayout.getWidth(15)),
                          const Column(
                            children: [Text("Tên User"), Text('1h later')],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Text('Khẩu phần'),
                    ],
                  )
                ],
              ),
            ),

            //Content
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Text(
                    'hi! this is contenttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt'),
              ),
            ),

            //Image
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RecipeDetails(),
                  ),
                );
              },
              child: Image.network(
                'https://picsum.photos/400/400',
                width: MediaQuery.of(context).size.width - 20,
                fit: BoxFit.cover,
              ),
            ),

            //Tương tác
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Like button
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isIconHeart
                            ? FluentSystemIcons.ic_fluent_heart_filled
                            : FluentSystemIcons.ic_fluent_heart_regular,
                      ),
                      onPressed: changeIconHeart,
                    ),
                    const Text('10'),
                  ],
                ),

                // Comment button
                const Gap(10),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                          FluentSystemIcons.ic_fluent_comment_regular),
                      onPressed: () {},
                    ),
                    const Text('5'),
                  ],
                ),

                // Save button
                const Gap(10),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isIconBookMark
                            ? FluentSystemIcons.ic_fluent_bookmark_filled
                            : FluentSystemIcons.ic_fluent_bookmark_regular,
                      ),
                      onPressed: changeIconBookMark,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
