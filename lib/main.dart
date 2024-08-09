import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_route/ui/screens/home/home_screen.dart';
import 'package:news_route/ui/screens/product%20details/product_details.dart';
import 'package:news_route/ui/screens/search/search_screen.dart';
import 'package:news_route/ui/screens/splash/splash_screen.dart';
import 'package:news_route/ui/screens/web/web_view_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        ProductDetails.routeName: (_) => const ProductDetails(),
        WebViewScreen.routeName: (_) => WebViewScreen(),
        SearchScreen.routeName: (_) => const SearchScreen(),
        SplashScreen.routeName: (_) => const SplashScreen(),
      },
    );
  }
}
