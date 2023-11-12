import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_styles.dart';

class Catogory extends StatelessWidget {
  const Catogory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: InkWell(
        onTap: () {
          // TODO:
        },
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Styles.postColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Khuyến cáo',
                style: Styles.headLineStyle1
                    .copyWith(color: Styles.textColor, fontSize: 22),
              ),
            ),
            Gap(AppLayout.getWidth(15)),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Styles.postColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Khuyến cáo',
                style: Styles.headLineStyle1
                    .copyWith(color: Styles.textColor, fontSize: 22),
              ),
            ),
            Gap(AppLayout.getWidth(15)),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Styles.postColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Khuyến cáo',
                style: Styles.headLineStyle1
                    .copyWith(color: Styles.textColor, fontSize: 22),
              ),
            ),
            Gap(AppLayout.getWidth(15)),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Styles.postColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Khuyến cáo',
                style: Styles.headLineStyle1
                    .copyWith(color: Styles.textColor, fontSize: 22),
              ),
            ),
            Gap(AppLayout.getWidth(15)),
          ],
        ),
      ),
    );
  }
}
