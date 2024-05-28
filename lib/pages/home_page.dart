import 'package:flutter/material.dart';
import 'package:mini_food_app/components/my_current_location.dart';
import 'package:mini_food_app/components/my_description_box.dart';
import 'package:mini_food_app/components/my_food_tile.dart';
import 'package:mini_food_app/components/my_tab_bar.dart';
import 'package:mini_food_app/model/food_model.dart';
import 'package:mini_food_app/model/restauran_model.dart';
import 'package:mini_food_app/pages/food_page.dart';
import 'package:provider/provider.dart';

import '../components/my_sliver_appbar.dart';
import '../components/mydrawer.dart';
import '../themes/light_theme.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((element) => element.category == category).toList();
  }

  // return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          return MyFoodTile(
              food: categoryMenu[index],
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FoodPage(food: categoryMenu[index])));
              });
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: bgColor,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MySliverAppbar(
                  title: MyTabBar(
                    tabController: _tabController,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(
                        indent: 25,
                        endIndent: 25,
                        color: lightGrey,
                      ),
                      MyCurrentLocation(),
                      const MyDescriptionBox(),
                    ],
                  ),
                )
              ],
          body: Consumer<Restaurant>(
            builder: (context, restauran, child) => TabBarView(
                controller: _tabController,
                children: getFoodInThisCategory(restauran.menu)),
          )),
    );
  }
}
