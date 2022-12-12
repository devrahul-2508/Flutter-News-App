// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_news_app/models/article.dart';

class HeadLineCard extends StatelessWidget {
  const HeadLineCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 400,
        child: ClipRRect(
          child: (article.urlToImage!=null)
              ? Image(
                  image: NetworkImage(article.urlToImage!),
                  fit: BoxFit.cover,
                )
              : Container(),
        ),
      ),
      Container(
        height: 430.0,
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.grey.withOpacity(0.0),
                  Colors.black,
                ],
                stops: [
                  0.0,
                  1.0
                ])),
      ),
      Positioned(
        bottom: 20,
        left: 10.0,
        right: 20.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            article.title!,
            maxLines: 2,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      )
    ]);
  }
}
