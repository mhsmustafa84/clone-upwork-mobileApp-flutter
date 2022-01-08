import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:upwork/View/Pages/TalentPages/Proposals.dart';
import 'package:upwork/constanse.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex =0;

  @override
  Widget build(BuildContext context) {
    return CustomNavigationBar(
      elevation: 10,
      iconSize: 30.0,
      selectedColor: bgUpwork,
      strokeColor: Colors.white,
      unSelectedColor: Color(0xff6c788a),
      backgroundColor: Colors.white,
      items: [
        CustomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text(
            "Jobs",
            style: TextStyle(color: Color(0xff6c788a), fontSize: 12),
          ),
          selectedTitle: Text(
            "Jobs",
            style: TextStyle(color: bgUpwork, fontSize: 14),
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.description_outlined),
          title: Text(
            "Proposals",
            style: TextStyle(color: Color(0xff6c788a), fontSize: 11),
          ),
          selectedTitle: Text(
            "Proposals",
            style: TextStyle(color: bgUpwork, fontSize: 13),
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
  Icons.work_outline_outlined,
),
          title: Text(
            "Contracts",
            style: TextStyle(color: Color(0xff6c788a), fontSize: 11),
          ),
          selectedTitle: Text(
            "Contracts",
            style: TextStyle(color: bgUpwork, fontSize: 13),
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.chat_outlined),
          title: Text(
            "Messages",
            style: TextStyle(color: Color(0xff6c788a), fontSize: 11),
          ),
          selectedTitle: Text(
            "Messages",
            style: TextStyle(color: bgUpwork, fontSize: 13),
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.notifications_outlined),
          title: Text(
            "Offers",
            style: TextStyle(color: Color(0xff6c788a), fontSize: 11),
          ),
          selectedTitle: Text(
            "Offers",
            style: TextStyle(color: bgUpwork, fontSize: 13),
          ),
          badgeCount: 5,
          showBadge: true,
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          print(_currentIndex);
          switch (index) {
            case 0:
              Navigator.pushNamed(context, "/jobs");
              _currentIndex = index;
              break;
            case 1:
              _currentIndex = index;
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProposalsPage();
              }));
              print(index);
              break;
            case 2:
              Navigator.pushNamed(context, "/contracts");
              _currentIndex = index;
              break;
              break;
            case 3:
              Navigator.pushNamed(context, "/messages");
              _currentIndex = index;
              break;
            case 4:
              Navigator.pushNamed(context, "/offers");
              _currentIndex = index;
              break;
            default:
          }
        });
      },
    );
  }
}
