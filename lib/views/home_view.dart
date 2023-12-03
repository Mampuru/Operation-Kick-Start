
import 'package:flutter/material.dart';
import 'package:oks/contants.dart';
import 'package:oks/models/news_feed_model.dart';
import 'package:oks/widgets/card_widget.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<NewsFeed> newsFeedItems = [];
  late Future _getNewsFeed;
  
  @override
  void initState() {
    super.initState();
    _getNewsFeed = getNewsFeed();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getNewsFeed,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'ERROR: ${snapshot.error}',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: newsFeedItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final newsFeedItem = newsFeedItems[index];
                      return CardWidget(
                        userIcon: defaultIcon,
                        title: newsFeedItem.title.toString(),
                        timeLogged: "17h ago",
                        issueImage: LogoPath,
                        description:newsFeedItem.description.toString(),
                      );
                    },
                  ),
                ),

              ],
            );
          }else{
            return Column(children: [
              Center(
                child: Text(
                  'No NewsFeed yet!',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: CircularProgressIndicator(color: Black,),
              )
            ]);
          }

        });
  }

  Future<List<dynamic>> getNewsFeed() async {
    newsFeedItems = [];
    for (int i = 0; i < 10; i++) {
      newsFeedItems.add(
          NewsFeed(id: "Id $i",
              title: "TITLE OF THE ISSUE $i",
              description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
              url: "Image $i"));
    }
    return newsFeedItems;
  }
}
