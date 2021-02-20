import 'package:flutter/material.dart';
import 'package:new_app/helper/news.dart';
import 'package:new_app/models/article_model.dart';
import 'package:new_app/widgets/article_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _isLoading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ArticleCard(
                    imageURL: articles[index].urlToImage,
                    title: articles[index].title,
                    desc: articles[index].content,
                    url: articles[index].url,
                  );
                },
                itemCount: articles.length,
              ),
            ),
    );
  }
}
