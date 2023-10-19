import 'package:flutter/material.dart';
import 'package:news_route/data/api/api_manager.dart';
import 'package:news_route/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_route/ui/screens/home/tabs/news/news_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "homeScreen" ;

  @override
  Widget build(BuildContext context) {
    ApiManager.getSources();
    return Stack(
      children: [
        Image.asset(
          width: double.infinity,
            "assets/images/splash.png",
            fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(
                "news tab",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 22,
              ),
            ),
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
          body: CategoriesTab(),
          drawer: buildDrawerWidget(context),
        ),
      ],
    );
  }

  Widget buildDrawerWidget(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.20,
            color: Colors.green,
            child: Center(
              child: Text(
                  "News App!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          TextButton(
              onPressed:(){} ,
              child: Row(
                children: [
                  Icon(
                      Icons.list,
                    size: 35,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10
                  ),
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
            onPressed:(){} ,
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 35,
                  color: Colors.black,
                ),
                SizedBox(
                    width: 10
                ),
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
}
