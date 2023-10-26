import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_route/data/model/articles_response.dart';
import 'package:news_route/ui/screens/web/web_view_screen.dart';

class ProductDetails extends StatelessWidget {
  static const String routeName = "productDetails";

  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as Article;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "News Title",
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
      body: Stack(
        children: [
          Image.asset(
            width: double.infinity,
            "assets/images/splash.png",
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: arg.urlToImage ?? "",
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Image.network(
                          "https://awlights.com/wp-content/uploads/sites/31/2017/05/placeholder-news.jpg",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    arg.source?.name ?? "",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff79828B),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    arg.title ?? "",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff42505C)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    arg.publishedAt ?? "",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff79828B),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    arg.content ?? "",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, WebViewScreen.routeName,
                          arguments: arg.url as String);
                    },
                    child: const Text(
                      "View Full Article >>",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
