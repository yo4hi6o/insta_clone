import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/view/common/components/user_card.dart';
import 'package:insta_clone/view_models/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchUserDelegate extends SearchDelegate<User> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);

    return theme.copyWith(brightness: Brightness.dark);
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        print("no result");
        close(context, null);
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResults(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResults(context);
  }

  //todo ユーザー検索処理
  Widget _buildResults(BuildContext context) {
    final searchViewModel =
        Provider.of<SearchViewModel>(context, listen: false);
    searchViewModel.searchUsers(query);

    return ListView.builder(
      itemCount: searchViewModel.soughtUsers.length,
      itemBuilder: (context, int index) {
        final user = searchViewModel.soughtUsers[index];
        return UserCard(
          photoUrl: user.photoUrl,
          title: user.inAppUserName,
          subTitle: user.bio,
          onTap: () {
            close(context, user);
          },
        );
      },
    );
  }
}
