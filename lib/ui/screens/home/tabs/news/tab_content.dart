// ignore_for_file: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_route/data/repositories/news_repo/data_sources/online_data_source.dart';
import 'package:news_route/data/model/articles_response.dart';
import 'package:news_route/data/model/sources_response.dart';
import 'package:news_route/ui/screens/product%20details/product_details.dart';

class TabContent extends StatelessWidget {
  Source source;

  TabContent(this.source, {super.key});

  late Article selectedArticle;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: OnlineDataSource().getArticles(source.id!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.articles!.length,
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  selectedArticle = snapshot.data!.articles![index];
                  Navigator.pushNamed(context, ProductDetails.routeName,
                      arguments: selectedArticle);
                },
                child:
                    buildNewsWidget(snapshot.data!.articles![index], context)),
          );
        } else if (snapshot.hasError) {
          return Center(
              child: Text(
            "Sorry No Data !!",
            style: TextStyle(
              color: Colors.red[700],
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildNewsWidget(Article article, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.network(
                  "https://awlights.com/wp-content/uploads/sites/31/2017/05/placeholder-news.jpg",
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            article.author ?? "",
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            article.title ?? "",
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            article.publishedAt ?? "",
            textAlign: TextAlign.end,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
