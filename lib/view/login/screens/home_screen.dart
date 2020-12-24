import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/view/activities/pages/activities_page.dart';
import 'package:insta_clone/view/feed/pages/feed_page.dart';
import 'package:insta_clone/view/post/pages/post_page.dart';
import 'package:insta_clone/view/profile/pages/profile_page.dart';
import 'package:insta_clone/view/search/pages/search_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _pages;
  int _currentIndex = 0;

  @override
  void initState() {
    _pages = [
      FeedPage(),
      SearchPage(),
      PostPage(),
      ActivitiesPage(),
      ProfilePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            label: "トップニュース",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.search),
            label: "検索",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.plusSquare),
            label: "追加",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heart),
            label: "アクティビティ",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: "ユーザー",
          ),
        ],
      ),
    );
  }
}
