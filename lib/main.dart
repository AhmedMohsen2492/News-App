import 'package:flutter/material.dart';
import 'package:news_route/ui/screens/home/home_screen.dart';
import 'package:news_route/ui/screens/product%20details/product_details.dart';
import 'package:news_route/ui/screens/search/search_screen.dart';
import 'package:news_route/ui/screens/web/webView_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
        ProductDetails.routeName : (_) => ProductDetails(),
        WebViewScreen.routeName :(_)=> WebViewScreen(),
        SearchScreen.routeName :(_) => SearchScreen(),
      },
    );
  }
}
