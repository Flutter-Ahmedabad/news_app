import 'package:flutter/material.dart';
import 'package:new_app/screens/article_screen.dart';

class ArticleCard extends StatelessWidget {
  final String imageURL, title, desc, url;

  ArticleCard({
    @required this.imageURL,
    @required this.desc,
    @required this.title,
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleScreen(
              url: url,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageURL),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              desc,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
