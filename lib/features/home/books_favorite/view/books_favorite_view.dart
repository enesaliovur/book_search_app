import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/init/lang/locale_keys.g.dart';
import '../widgets/favorites_body.dart';

class FavoriteBooksView extends StatefulWidget {
  FavoriteBooksView({
    Key? key,
  }) : super(key: key);

  @override
  _FavoriteBooksViewState createState() => _FavoriteBooksViewState();
}

class _FavoriteBooksViewState extends State<FavoriteBooksView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: _buildTextContent(context),
        ),
        body:Column(children: [FavoritesBody()]));
  }

  Widget _buildTextContent(BuildContext context) {
    return Text(LocaleKeys.favorite_title.tr(),
        style: Theme.of(context)
            .textTheme
            .headline4);
            
  }
}
