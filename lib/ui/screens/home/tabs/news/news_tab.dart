// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:news_route/data/model/sources_response.dart';
import 'package:news_route/data/model/category_dm.dart';
import 'package:news_route/ui/screens/home/tabs/news/news_tab_view_model.dart';
import 'package:news_route/ui/screens/home/tabs/news/tab_content.dart';
import 'package:provider/provider.dart';

class NewsTab extends StatefulWidget {
  CategoryDM selectedCategory;

  NewsTab(this.selectedCategory, {super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int currentTabIndex = 0;
  NewsTabViewModel newsTabViewModel = NewsTabViewModel();

  @override
  void initState() {
    super.initState();
    newsTabViewModel.getSource(widget.selectedCategory.id);
  }

  @override
  Widget build(BuildContext context) {
    Widget currentView;
    return ChangeNotifierProvider(
        create: (_) => newsTabViewModel,
        child: Consumer<NewsTabViewModel>(
          builder: (context, viewModel, _) {
            if (viewModel.isLoading) {
              currentView = const Center(child: CircularProgressIndicator());
            } else if (viewModel.sources.isNotEmpty) {
              currentView = buildNewsTab(viewModel.sources);
            } else {
              currentView = Center(
                child: Text(
                  "${viewModel.errorText}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              );
            }
            return currentView;
          },
        ));
  }

  Widget buildNewsTab(List<Source> list) {
    return DefaultTabController(
      length: list.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
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
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: TabBarView(
              children:
                  list.map((singleSource) => TabContent(singleSource)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabWidget(String name, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
