import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dio/dio.dart';
import 'package:flutter_news_app/models/article.dart';
import 'package:flutter_news_app/models/newsrespone.dart';
import 'package:flutter_news_app/network/dio_client.dart';
import 'package:flutter_news_app/widgets/headline_card.dart';
import 'package:flutter_news_app/widgets/news_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

NewsResponse? response;
NewsResponse? headerresponse;

Future getArticle(String category) async {
  try {
    // Perform GET request to the endpoint "/users/<id>"
    var articledata = await DioClient().dio.get(
        "https://newsapi.org/v2/top-headlines?country=in&category=${category}&apiKey=bb5742eede6549cd938e191f9b5919b6");

    // Prints the raw data returned by the server

    // Parsing the raw JSON data to the User class

    // print(articledata.data);
    response = NewsResponse.fromJson(articledata.data.toString());
    print(response);
  } catch (e) {
    print(e);
  }
}

Future fetchTopHeadlines() async {
  try {
    var articledata = await DioClient().dio.get(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=bb5742eede6549cd938e191f9b5919b6");
    headerresponse = NewsResponse.fromJson(articledata.data.toString());
  } catch (e) {
    print(e);
  }
}

int selectedIndex = 0;
List<String> categories = [
  "All",
  "Technology",
  "Science",
  "Sports",
  "General",
  "Business",
  "Entertainment"
];

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getArticle(categories[selectedIndex]);
    fetchTopHeadlines();
    super.initState();
  }

  Widget buildNewsRecycler(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FutureBuilder(
              future: getArticle(categories[selectedIndex]),
              builder: (context, snapshot) {
                return (response == null)
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Color(0xff192e51),
                      ))
                    : ListView.builder(
                        itemCount: response?.articles.length,
                        itemBuilder: (context, index) {
                          return NewsTile(article: response!.articles[index]);
                        });
              })),
    );
  }

  Widget buildChipWidgets(BuildContext context) {
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
                    response = null;
                    getArticle(categories[selectedIndex]);
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
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
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
                  borderRadius: BorderRadius.circular(30),
                  child: FutureBuilder(
                      future: fetchTopHeadlines(),
                      builder: ((context, snapshot) {
                        return (headerresponse == null)
                            ? Center(
                                child: CircularProgressIndicator(
                                color: Color(0xff192e51),
                              ))
                            : CarouselSlider.builder(
                                itemCount: headerresponse!.articles.length,
                                itemBuilder: (BuildContext context,
                                        int itemIndex, int pageViewIndex) =>
                                    HeadLineCard(
                                        article: headerresponse!
                                            .articles[itemIndex]),
                                options: CarouselOptions(
                                    height: 400,
                                    aspectRatio: 16 / 9,
                                    viewportFraction: 1,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 5),
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 500),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeFactor: 0.3,
                                    scrollDirection: Axis.horizontal));
                      })),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildChipWidgets(context),
            buildNewsRecycler(context)
          ],
        ));
  }
}
