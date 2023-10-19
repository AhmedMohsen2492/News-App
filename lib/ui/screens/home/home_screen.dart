import 'package:flutter/material.dart';
import 'package:news_route/data/api/api_manager.dart';
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
          body: NewsTab(),
        ),
      ],
    );
  }
}
