import 'package:flutter/material.dart';

import '../../../../book/models/book_model.dart';
import '../../../../book/widgets/book_card_item.dart';


class SearchResults extends StatelessWidget {
  final List<Book> books;

  const SearchResults({Key? key, required this.books}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        return BookCardItem(book: books[index],);
      },
    );
  }
}