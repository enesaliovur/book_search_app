import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/book_bloc/book_bloc.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/theme/app_theme.dart';

class SearchBar extends StatefulWidget {
  SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _textController = TextEditingController();
  late BookBloc _bookBloc;

  @override
  void initState() {
    super.initState();
    _bookBloc = BlocProvider.of<BookBloc>(context);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
      child: Row(
        children: [
          Expanded(flex: 14, child: _buildSearchField()),
          Spacer(flex: 1),
          Expanded(
              flex: 5,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(LocaleKeys.search_button_text.tr(),
                      style: textTheme.button))),
        ],
      ),
    );
  }

  TextField _buildSearchField() {
    return TextField(
      controller: _textController,
      onChanged: (text) {
        if (text.length < 501) {
          _bookBloc.add(
            TextChanged(text: text),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: colorScheme.error,
            content: Text(LocaleKeys.invalid_term.tr(),
                style: Theme.of(context).textTheme.bodyText2),
            action: SnackBarAction(
              label: LocaleKeys.okey.tr(),
              onPressed: () {},
              textColor: colorScheme.primary,
            ),
          ));
        }
      },
      decoration: InputDecoration(
        hintText: LocaleKeys.search_hint_Text.tr(),
        hintStyle: Theme.of(context).textTheme.bodyText2,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: colorScheme.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        isDense: true,
        prefixIcon: Icon(Icons.search, size: 30, color: colorScheme.primary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
