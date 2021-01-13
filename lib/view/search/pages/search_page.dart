import 'package:flutter/material.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/style.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view/profile/screens/profile_screen.dart';
import 'package:insta_clone/view/search/components/search_user_delegate.dart';

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
  _searchUser(BuildContext context) async {
    final selectedUser = await showSearch(
      context: context,
      delegate: SearchUserDelegate(),
    );
    //ユーザー検索結果を受けた処理

    if (selectedUser != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProfileScreen(
            profileMode: ProfileMode.OTHER,
            selectedUser: selectedUser,
          ),
        ),
      );
    }
  }
}
