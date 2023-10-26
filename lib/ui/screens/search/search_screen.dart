import 'package:flutter/material.dart';
import 'package:news_route/ui/screens/search/search_content.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "search";

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
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
            title: const Text(
              "Search",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 22,
              ),
            ),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    searchText = value;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.green, width: 2)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.green, width: 2)),
                    hintText: "Enter a search term",
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SearchContent(searchText),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
