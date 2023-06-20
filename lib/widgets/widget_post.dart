import 'package:cooking_social_network/screens/recipe_details.dart';
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
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: InkWell(
          onTap: () {
            // TODO:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetails(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.network(
                                'https://picsum.photos/200/200',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text('John Doe'),
                            subtitle: Text('1 hour ago'),
                          ),
                        ),
                        const Text(
                          'This is the content of the post.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(10),
                Row(
                  children: [
                    // Padding(padding: EdgeInsets.only(top: 10)),
                    Image.network(
                      'https://picsum.photos/400/400',
                      width: MediaQuery.of(context).size.width - 20,
                      // height: MediaQuery.of(context).size.height * 0.50,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(isIconHeart
                              ? FluentSystemIcons.ic_fluent_heart_filled
                              : FluentSystemIcons.ic_fluent_heart_regular),
                          onPressed: changeIconHeart,
                        ),
                        const Text('10'),
                      ],
                    ),
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
                    const Gap(10),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(isIconBookMark
                              ? FluentSystemIcons.ic_fluent_bookmark_filled
                              : FluentSystemIcons.ic_fluent_bookmark_regular),
                          onPressed: changeIconBookMark,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
