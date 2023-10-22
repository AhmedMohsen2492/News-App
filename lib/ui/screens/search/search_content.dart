import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_route/data/api/api_manager.dart';
import 'package:news_route/data/model/ArticlesResponse.dart';
import 'package:news_route/ui/screens/product%20details/product_details.dart';

class SearchContent extends StatelessWidget {
  String searchText ;
  SearchContent(this.searchText);
  late Article selectedArticle ;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSearchArticles(searchText),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Wrong input",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          );
        }
        else if (snapshot.hasData){
          return Expanded(
            child: ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                  selectedArticle = snapshot.data!.articles![index];
                  Navigator.pushNamed(
                      context, ProductDetails.routeName,
                    arguments: selectedArticle
                  );
                },
                child: buildSearchWidget(
                  snapshot.data!.articles![index],context
                ),
              ),
            ),
          );
        }
        else
        {
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          );
        }
      },
    );
  }

  Widget buildSearchWidget(Article article , BuildContext context){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height *0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.network(
                  "https://awlights.com/wp-content/uploads/sites/31/2017/05/placeholder-news.jpg",),
              ),
            ),
          ),
          SizedBox(height: 4,),
          Text(
            article.author??"",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey
            ),
          ),
          SizedBox(height: 8,),
          Text(
            article.title??"",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          SizedBox(height: 4,),
          Text(
            article.publishedAt??"",
            textAlign: TextAlign.end,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }

}
