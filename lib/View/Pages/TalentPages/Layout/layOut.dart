import 'package:flutter/material.dart';
import 'package:upwork/View/Pages/TalentPages/HomePage.dart';
import 'package:upwork/View/components/Shared/CustomDrawer.dart';
import 'package:upwork/View/components/Talent/BottomNav.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      
      bottomNavigationBar: BottomNav(),
    );
  }
}