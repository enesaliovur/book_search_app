import 'package:flutter/material.dart';

import '../../../../book/models/book_model.dart';
import '../../../../book/widgets/book_card_item.dart';


class FavoriteResults extends StatefulWidget {
final List<Book> books;

  const FavoriteResults({Key? key, required this.books}) : super(key: key);

  @override
  State<FavoriteResults> createState() => _FavoriteResultsState();
}

class _FavoriteResultsState extends State<FavoriteResults> {

 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.books.length,
      itemBuilder: (BuildContext context, int index) {
        return BookCardItem(book: widget.books[index], );
      },
    );
  }
}