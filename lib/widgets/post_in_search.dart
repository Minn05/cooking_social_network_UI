import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../screens/home/recipe_details.dart';
import '../utils/app_layout.dart';

class PostInSearch extends StatefulWidget {
  const PostInSearch({super.key});

  @override
  State<PostInSearch> createState() => _PostInSearchState();
}

class _PostInSearchState extends State<PostInSearch> {
  bool isIconBookMark = false;

  void changeIconBookMark() {
    setState(() {
      isIconBookMark = !isIconBookMark;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetails(),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width - 20,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: AppLayout.getHeight(260),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                        image: NetworkImage('https://picsum.photos/400/400'),
                        fit: BoxFit.cover),
                  ),
                ),
                Gap(AppLayout.getHeight(15)),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
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
                            Gap(AppLayout.getWidth(20)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'John Doe',
                                  style: Styles.headLineStyle2,
                                ),
                                Text(
                                  'Tên món ăn',
                                  style: Styles.headLineStyle1
                                      .copyWith(color: Styles.textColor),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(isIconBookMark
                              ? FluentSystemIcons.ic_fluent_bookmark_filled
                              : FluentSystemIcons.ic_fluent_bookmark_regular),
                          onPressed: changeIconBookMark,
                        ),
                      ),
                    ],
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
