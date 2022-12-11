// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeadLineCard extends StatelessWidget {
  const HeadLineCard({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 380,
        child: ClipRRect(
          child: Image(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        height: 400.0,
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
            text,
            maxLines: 2,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      )
    ]);
  }
}
