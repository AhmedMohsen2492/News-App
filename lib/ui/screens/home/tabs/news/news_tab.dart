import 'dart:math';
import 'package:flutter/material.dart';
import 'package:news_route/data/api/api_manager.dart';
import 'package:news_route/data/model/SourcesResponse.dart';

class NewsTab extends StatefulWidget {

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int currentTabIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return buildNewsTab(snapshot.data!);
        }else if (snapshot.hasError){
          return Text(snapshot.error.toString());
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildNewsTab(List<Source> list) {
    return DefaultTabController(
      length: list.length,
      child: Column(
        children: [
          SizedBox(height: 8,),
          TabBar(
            onTap: (value){
              currentTabIndex = value ;
              setState(() {});
            },
            indicatorColor: Colors.transparent,
            isScrollable: true,
              tabs: list.map((singleSource) => buildTabWidget(singleSource.name??"",
                  currentTabIndex == list.indexOf(singleSource))).toList(),
          ),
          Expanded(
            child: TabBarView(
                children: list.map((singleSource) => Container(color: Colors.green)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabWidget(String name , bool isSelected){
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:  isSelected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.blue),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
