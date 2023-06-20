import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class Catogory extends StatelessWidget {
  const Catogory({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO:
      },
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Khuyến cáo',
              style: Styles.headLineStyle1
                  .copyWith(color: Styles.textColor, fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
