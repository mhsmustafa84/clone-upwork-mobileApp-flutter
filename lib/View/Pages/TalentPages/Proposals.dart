import 'package:flutter/material.dart';
import 'package:upwork/Models/ProposalsData.dart';
import 'package:upwork/Services/UserDataService.dart';
import 'package:upwork/View/components/Shared/CustomCircleAvatar.dart';
import 'package:upwork/View/components/Shared/CustomDrawer.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';
import 'package:upwork/View/components/Talent/Active1.dart';
import 'package:upwork/View/components/Talent/Archived.dart';
import 'package:upwork/View/components/Talent/BottomNav.dart';

class ProposalsPage extends StatefulWidget {
  // final JobDataModel job;
  // ProposalsPage(this.job);

  @override
  _ProposalsPageState createState() => _ProposalsPageState();
}

class _ProposalsPageState extends State<ProposalsPage> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
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
                "Proposals",
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              CustomMenuButton(),
            ],
            bottom: TabBar(
              indicatorColor: Color(0xFF8ACC5E),
              labelColor: Color(0xFF8ACC5E),
              unselectedLabelColor: Colors.white,
              tabs: <Widget>[
                Tab(text: 'Active'),
                Tab(text: 'Archived'),
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            ActiveBody(),
            ArchivedBody(),
          ]),
          bottomNavigationBar: BottomNav(),
        ));
  }
}
