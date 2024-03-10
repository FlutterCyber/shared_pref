import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_pref/model/news.dart';
import 'package:shared_pref/services/network_service.dart';

class NewsPage extends StatefulWidget {
  static const String id = "news_page";

  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var logger = Logger();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getInfos();
    postInfo();
  }

  Future<void> getInfos() async {
    NetworkService.GET(NetworkService.API_GET, NetworkService.paramsGET())
        .then((response) => {
              logger.i(response),
            });
  }

  postInfo() {
    News news =
        News(userId: 102, id: 103, title: "Shoqosim", body: "Abdujabbor");
    NetworkService.POST(NetworkService.API_POST,
            NetworkService.paramsPOST(news: news))
        .then((response) => {
              logger.i(response),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "News page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
    );
  }
}
