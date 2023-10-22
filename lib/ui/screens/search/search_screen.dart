import 'package:flutter/material.dart';
import 'package:news_route/ui/screens/search/search_content.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "search" ;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = "" ;

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
            title: Text(
              "Search",
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
          body: Container(
            margin: EdgeInsets.all(20),
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
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2
                      )
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.green,
                            width: 2
                        )
                    ),
                    hintText: "Enter a search term",
                    prefixIcon: Icon(Icons.search),

                  ),
                ),
                SizedBox(height: 20,),
                SearchContent(searchText),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
