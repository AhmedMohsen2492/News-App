import 'package:flutter/material.dart';
import 'package:news_route/data/api/api_manager.dart';
import 'package:news_route/data/model/ArticlesResponse.dart';
import 'package:news_route/data/model/SourcesResponse.dart';

class TabContent extends StatelessWidget {
  Source source ;
  TabContent(this.source);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getArticles(source.id!),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data!.articles!.length,
            itemBuilder: (context, index) => buildNewsWidget(snapshot.data!.articles![index] , context),
          );
        }else if (snapshot.hasError){
          return Text(snapshot.error.toString());
        }else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildNewsWidget(Article article , BuildContext context){
    return Container(
      margin: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              height: MediaQuery.of(context).size.height *0.25,
                fit: BoxFit.cover,
                article.urlToImage??"https://awlights.com/wp-content/uploads/sites/31/2017/05/placeholder-news.jpg"),
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
