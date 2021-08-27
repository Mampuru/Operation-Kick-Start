
import 'package:flutter/material.dart';
import 'package:oks/contants.dart';
import 'package:oks/models/news_feed.dart';
import 'package:oks/views/report_issue_view.dart';
import 'package:oks/widgets/bottom_navbar_widget.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        leading: Icon(Icons.account_circle,size:30,color: Colors.white,),
        title: Text("My Community"),
      ),
      bottomNavigationBar:BottomNavBottom(),
      body:buildContentList(context),
      floatingActionButton:  FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ReportIssueView()));
        },
        child: const Icon(Icons.edit,color: White,),
        backgroundColor: Black,
      ),
    );
  }

  Widget buildContentList(BuildContext context){
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
                      return Card(
                        elevation: 1,
                        child: ListTile(
                          onTap: () {
                            showDialog(context: context, builder: (_) {
                              return AlertDialog(
                                title: Text(newsFeedItem.title),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(newsFeedItem.description)
                                    ],
                                  ),
                                ),
                              );
                            });
                          },
                          title: Text(
                            newsFeedItem.title.toString(),
                            style: TextStyle(
                                color: Black,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(newsFeedItem.description.toString(),
                              style: TextStyle(
                                  fontFamily: 'Sora', color: PrimaryColor)),
                          // trailing: Text(newsFeedItem.sendTime.toString(),style: TextStyle(color: kDarkBlackColor,fontSize: 10.0),),
                          leading: Image.asset(LogoPath),
                        ),
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
      newsFeedItems.add(NewsFeed(id: "Id $i", title: "Title $i", description: "Description $i", url: "Image $i"));
    }
    return newsFeedItems;
  }
}
