// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mini_food_app/model/food_model.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  List<Tab> _buildCategoryTab() {
    return FoodCategory.values
        .map((cateogry) => Tab(
              text: cateogry
                      .toString()
                      .split('.')
                      .last
                      .substring(0, 1)
                      .toUpperCase() +
                  cateogry.toString().split('.').last.substring(1),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
          labelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          labelPadding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.tab,
          controller: tabController,
          tabs: _buildCategoryTab()),
    );
  }
}
