import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_demo/Service/hacker_news.dart';
import 'package:mobx_demo/model/News.dart';

import 'package:url_launcher/url_launcher.dart';

class SecondDemoPage extends StatefulWidget {

  @override
  SecondDemoPageState createState() {
    return new SecondDemoPageState();
  }
}

class SecondDemoPageState extends State<SecondDemoPage> {
  final _hackerNews = HackerNews();
  final snackBar = SnackBar(
    content: Text('News List will be update in sometime..'),
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {
        // Some code to undo the change!
      },
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _hackerNews.getNewsList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Hacker News'),
        ),
        body: Observer(
          builder: (context) => RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 1));
              await _hackerNews.increaseNewsLimit();
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Container(
              child: Observer(
                  builder: (_) => ((_hackerNews.news != null) &&
                          (_hackerNews.news.isNotEmpty))
                      ? ListView.builder(
                          itemCount: _hackerNews.news.length,
                          itemBuilder: (_, index) {
                            final newsArticle = _hackerNews.news[index];
                            return _makeArticleContainer(newsArticle);
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        )),
            ),
          ),
        ),
      );

  Widget _makeArticleContainer(News newsArticle) {
    return Padding(
      key: Key(newsArticle.title),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(
          newsArticle.title,
          style: TextStyle(fontSize: 24.0),
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("${newsArticle.by} comments"),
              IconButton(
                onPressed: () async {
                  if (await canLaunch(newsArticle.url)) {
                    launch(newsArticle.url);
                  }
                },
                icon: Icon(Icons.launch),
              )
            ],
          ),
        ],
      ),
    );
  }
}
