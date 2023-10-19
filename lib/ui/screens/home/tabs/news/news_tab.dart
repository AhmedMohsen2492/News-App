import 'package:flutter/material.dart';
import 'package:news_route/data/api/api_manager.dart';
import 'package:news_route/data/model/SourcesResponse.dart';
import 'package:news_route/ui/screens/home/tabs/news/tab_content.dart';

class NewsTab extends StatefulWidget {
  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildNewsTab(snapshot.data!);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildNewsTab(List<Source> list) {
    return DefaultTabController(
      length: list.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 12,
          ),
          TabBar(
            onTap: (value) {
              currentTabIndex = value;
              setState(() {});
            },
            indicatorColor: Colors.transparent,
            isScrollable: true,
            tabs: list
                .map((singleSource) => buildTabWidget(singleSource.name ?? "",
                    currentTabIndex == list.indexOf(singleSource)))
                .toList(),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: TabBarView(
              children: list
                  .map((singleSource) => TabContent(singleSource))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabWidget(String name, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.green,width: 2),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: isSelected ? Colors.white :Colors.black,
        ),
      ),
    );
  }
}
