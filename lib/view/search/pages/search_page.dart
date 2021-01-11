import 'package:flutter/material.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/style.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.search),
        title: InkWell(
          splashColor: Colors.white30,
          onTap: () => _searchUser(context),
          child: Text(
            S.of(context).search,
            style: searchPageAppbarTitleTextStyle,
          ),
        ),
      ),
      body: Center(
        child: Text("SearchPage"),
      ),
    );
  }

  //todo
  _searchUser(BuildContext context) {}
}
