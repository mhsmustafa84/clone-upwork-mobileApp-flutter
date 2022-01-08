import 'package:flutter/material.dart';
import 'package:upwork/View/Pages/TalentPages/MyfeedPage.dart';
import 'package:upwork/View/Pages/TalentPages/SavedJobs.dart';
import 'package:upwork/View/Pages/TalentPages/SearchPage.dart';
import 'package:upwork/View/components/Shared/CustomCircleAvatar.dart';
import 'package:upwork/View/components/Shared/CustomDrawer.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';
import 'package:upwork/View/components/Talent/BottomNav.dart';
import 'package:upwork/constanse.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: CustomCircleAvatar(),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: Center(
            child: Text(
              "Jobs",
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            CustomMenuButton(),
          ],
          bottom: TabBar(
            indicatorColor: bgUpwork,
            labelColor: Color(0xFF8ACC5E),
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: "Myfeed",
              ),
              Tab(
                text: "Saved",
              ),
              Tab(
                text: "Search",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MyFeedPage(),
            SavedJobs(),
            SearchPage(),
          ],
        ),
        bottomNavigationBar: BottomNav(),
      ),
    );
  }
}