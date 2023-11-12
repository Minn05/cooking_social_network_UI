// import 'package:cooking_social_network/widgets/text_input.dart';
import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:cooking_social_network/widgets/post_in_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import '../../utils/app_styles.dart';
// import 'package:get/get.dart';


class SeachScreen extends StatelessWidget {
  const SeachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: ElevatedButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: Mysearch(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF9F9FA),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Tìm kiếm',
                    style:
                        Styles.headLineStyle1.copyWith(color: Styles.textColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Text(
                    'Lịch sử tìm kiếm của bạn',
                    style: Styles.headLineStyle1
                        .copyWith(color: Styles.textColor, fontSize: 22),
                  ),
                ),
              ),
              Gap(AppLayout.getHeight(10)),
              PostInSearch(),
              Gap(AppLayout.getHeight(10)),
              PostInSearch(),
              Gap(AppLayout.getHeight(10)),
              PostInSearch(),
            ],
          ),
        ),
      ),
    );
  }
}

class Mysearch extends SearchDelegate {
  List<String> allData = [
    "Chicken",
    "Noodle",
    "beans",
    "potato",
    "mango",
    "Bún bò",
    "bún riêu",
    "Bánh xèo",
    "Chè"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(CupertinoIcons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuerry = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuerry.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuerry.length,
      itemBuilder: (context, index) {
        var result = matchQuerry[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuerry = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuerry.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuerry.length,
      itemBuilder: (context, index) {
        var result = matchQuerry[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
