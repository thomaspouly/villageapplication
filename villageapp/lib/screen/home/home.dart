import 'package:flutter/material.dart';
import 'package:villageapp/model/Choice.dart';

class HomePage extends StatefulWidget {
  String uid;

  HomePage(this.uid);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color color = Colors.red[300];
  double height;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: DefaultTabController(
        length: choices.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: height/5,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Steenbecque",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        )),
                    background: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Steenbecque_%28Nord%2C_Fr%29_%C3%A9glise_01.JPG/800px-Steenbecque_%28Nord%2C_Fr%29_%C3%A9glise_01.JPG",
                      fit: BoxFit.cover,
                    )),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black,
                    // These are the widgets to put in each tab in the tab bar.
                    tabs: choices.map((Choice choice) {
                      return Tab(
                        text: choice.title,
                        icon: Icon(choice.icon),
                      );
                    }).toList(),
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: Center(
            child: TabBarView(
              children: choices.map((Choice choice) {
                return Container(
                  child: ChoiceCard(choice: choice),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
