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
  List<News> items = [];
  var isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myParsing();
  }

  void myParsing() async {
    setState(() {
      isLoading = true;
    });
    var response = await NetworkService.GET(
        NetworkService.API_GET, NetworkService.paramsGET());

    if (response != null) {
      setState(() {
        items = NetworkService.parsingResponse(response);
        isLoading = false;
      });
    }
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
    NetworkService.POST(
            NetworkService.API_POST, NetworkService.paramsPOST(news: news))
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
        actions: [
          IconButton(
              onPressed: () {
                myParsing();
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ))
        ],
      ),
      body: Stack(
        children: [
          isLoading
              ? Center(child: const CircularProgressIndicator())
              : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (ctx, index) {
                    return responseItems(items[index]);
                  }),
        ],
      ),
    );
  }

  Widget responseItems(News news) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            news.title.toString().toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            news.body.toString(),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
