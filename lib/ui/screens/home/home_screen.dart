import 'package:flutter/material.dart';
import 'package:news_route/data/api/api_manager.dart';
import 'package:news_route/ui/screens/home/tabs/news/news_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "homeScreen" ;

  @override
  Widget build(BuildContext context) {
    ApiManager.getSources();
    return Scaffold(
      appBar: AppBar(
        title: Text("news tab"),
      ),
      body: NewsTab(),
    );
  }
}
