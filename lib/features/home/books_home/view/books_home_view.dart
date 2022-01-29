import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/theme/app_theme.dart';
import '../../books_favorite/view/books_favorite_view.dart';
import '../widgets/search_bar.dart';
import '../widgets/search_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: _buildTextContent(context),
          actions: [_buildFavoriteButton(context)]),
      body: Column(
        children: [SearchBar(), SearchBody()],
      ),
    );
  }

  Widget _buildFavoriteButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FavoriteBooksView()));
        },
        icon: Icon(
          Icons.favorite,
          size: 30,
          color: colorScheme.primary,
        ));
  }

  Widget _buildTextContent(BuildContext context) {
    return Text("${LocaleKeys.home_title.tr()}",
        style: Theme.of(context).textTheme.headline4);
  }
}
