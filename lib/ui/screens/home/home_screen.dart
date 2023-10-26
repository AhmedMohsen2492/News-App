import 'package:flutter/material.dart';
import 'package:news_route/data/model/category_dm.dart';
import 'package:news_route/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_route/ui/screens/home/tabs/news/news_tab.dart';
import 'package:news_route/ui/screens/home/tabs/settings/settings_tab.dart';
import 'package:news_route/ui/screens/search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryDM? selectedCategory;

  late Widget selectedTab;

  @override
  void initState() {
    super.initState();
    selectedTab = CategoriesTab(setSelectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            width: double.infinity,
            "assets/images/splash.png",
            fit: BoxFit.fill,
          ),
          WillPopScope(
            onWillPop: () async {
              if (selectedTab is CategoriesTab) {
                return Future.value(true);
              } else {
                selectedTab = CategoriesTab(setSelectedCategory);
                setState(() {});
                return Future.value(false);
              }
            },
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.green,
                title: Text(
                  selectedTab is CategoriesTab
                      ? "News App"
                      : selectedTab is NewsTab
                          ? selectedCategory!.title.toString()
                          : selectedTab is SettingsTab
                              ? "Settings"
                              : "",
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 22,
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SearchScreen.routeName);
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                      )),
                ],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
              ),
              body: selectedTab,
              drawer: buildDrawerWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrawerWidget() {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.20,
            color: Colors.green,
            child: const Center(
              child: Text(
                "News App!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              selectedCategory = null;
              selectedTab = CategoriesTab(setSelectedCategory);
              Navigator.pop(context);
              setState(() {});
            },
            child: const Row(
              children: [
                Icon(
                  Icons.list,
                  size: 35,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              selectedTab = const SettingsTab();
              Navigator.pop(context);
              setState(() {});
            },
            child: const Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 35,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void setSelectedCategory(CategoryDM categoryDM) {
    selectedCategory = categoryDM;
    selectedTab = NewsTab(selectedCategory!);
    setState(() {});
  }
}
