import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_news_app/models/article.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Color(0xffbe9e9f0),
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (article.urlToImage != null)
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              width: 100.0,
                              height: 120,
                              image: NetworkImage(article.urlToImage!),
                              fit: BoxFit.cover,
                            ))),
                  )
                : Padding(padding: EdgeInsets.symmetric(vertical: 60)),
            Container(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      article.title!,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffb192e51),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    article.description!,
                    maxLines: 2,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.bookmark,
                color: Color(0xffbff2950),
              ),
            )
          ],
        ),
      ),
    );
  }
}
