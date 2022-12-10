import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dio/dio.dart';
import 'package:flutter_news_app/models/article.dart';
import 'package:flutter_news_app/models/newsrespone.dart';
import 'package:flutter_news_app/network/dio_client.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

void getArticle() async {
  try {
    // Perform GET request to the endpoint "/users/<id>"
    var articledata = await DioClient().dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=bb5742eede6549cd938e191f9b5919b6");

    // Prints the raw data returned by the server

    // Parsing the raw JSON data to the User class

    print(articledata.data);
    NewsResponse response = NewsResponse.fromJson(articledata.data.toString());
    //List<Article> articles = response.articles;

    //print(response);
  } catch (e) {
    print(e);
  }
}

int selectedIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getArticle();
    super.initState();
  }

  Widget buildChipWidgets(BuildContext context) {
    List<String> categories = [
      "Sports",
      "Business",
      "Finance",
      "Automobiles",
      "Health"
    ];

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          reverse: false,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: (() {
                  setState(() {
                    selectedIndex = index;
                    print(selectedIndex);
                  });
                }),
                child: Chip(
                  label: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                  backgroundColor: selectedIndex == index
                      ? Color(0xff192e51)
                      : Color(0xffe9e9f0),
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Newzia",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications_on_outlined,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
              child: Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey,
                          Theme.of(context).colorScheme.surface,
                        ],
                        stops: [0, 0.8],
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage("assets/images/messi.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 350.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
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
                      "Messi leads Argentina to 2-0 win over Mexico at World Cup",
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            buildChipWidgets(context)
          ],
        ));
  }
}
