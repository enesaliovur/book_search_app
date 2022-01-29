import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/favorite_book_bloc/favorite_book_bloc.dart';
import '../../core/constants/app_constants.dart';
import '../../core/init/lang/locale_keys.g.dart';
import '../models/book_model.dart';

class BookCardItem extends StatefulWidget {
  final Book book;

  BookCardItem({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  State<BookCardItem> createState() => _BookCardItemState();
}

class _BookCardItemState extends State<BookCardItem> {
  FavoriteBookBloc? _favoriteBookBloc;

  @override
  void initState() {
    super.initState();

    _favoriteBookBloc = BlocProvider.of<FavoriteBookBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBookCard(context);
  }

  Widget _buildBookCard(context) {
    return InkWell(
      onLongPress: () {
        //Silme işlemi books_favorite_view ekranında çalışıyor
        _favoriteBookBloc!.add(DeleteFavoriteBook(book: widget.book));
      },
      onDoubleTap: () {
        _favoriteBookBloc!.add(AddFavoriteBook(book: widget.book));
      },
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
        child: Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: widget.book.isFavorite == true
                      ? Colors.amberAccent
                      : Colors.blue,
                  width: 2.0),
              borderRadius: BorderRadius.circular(4.0)),
          child: Column(
            children: [
              ListTile(
                leading: _buildBookImage(),
                title: _buildBookTitleTextContent(context),
                subtitle: _buildBookSubtitleTextContent(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildBookImage() {
    return Container(
      child: widget.book.thumbnail == null
          ? Image.asset(AppConstants.DEFAULT_BOOK_ASSETS_PATH)
          : CachedNetworkImage(
              width: MediaQuery.of(context).size.width / 10,
              imageUrl: widget.book.thumbnail.toString()),
    );
  }

  Column _buildBookSubtitleTextContent(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBookSubtitle(context),
        _buildBookAuthors(context),
        _buildBookPublisher(context),
        SizedBox(
          height: MediaQuery.of(context).size.height / 50,
        ),
        _buildBookPublishedatAndPages()
      ],
    );
  }

  Container _buildBookAuthors(context) {
    return Container(
      child: (widget.book.authors == null)
          ? Text("")
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocaleKeys.authors.tr(),
                    style: Theme.of(context).textTheme.bodyText2),
                SizedBox(
                  height: widget.book.authors!.length * 20,
                  child: ListView.builder(
                      itemCount: widget.book.authors!.length,
                      itemBuilder: (context, index) {
                        return Text(widget.book.authors![index].toString(),
                            style: Theme.of(context).textTheme.bodyText2);
                      }),
                ),
              ],
            ),
    );
  }

  Widget _buildBookPublishedatAndPages() {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 50),
      child: Wrap(
        spacing: 10,
        children: [
          Text(
              widget.book.publishedDate.toString() == null
                  ? ""
                  : "${LocaleKeys.published_at.tr()}: ${widget.book.publishedDate.toString()}",
              style: Theme.of(context).textTheme.bodyText2),
          Text(
              widget.book.pageCount == null
                  ? ""
                  : "${LocaleKeys.pages.tr()}: ${widget.book.pageCount}",
              style: Theme.of(context).textTheme.bodyText2)
        ],
      ),
    );
  }

  Text _buildBookPublisher(context) {
    return Text(
      widget.book.publisher == null
          ? ""
          : "${LocaleKeys.publisher.tr()}: ${widget.book.publisher}",
      style: Theme.of(context).textTheme.bodyText2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Text _buildBookSubtitle(context) {
    return Text(
      widget.book.subtitle == null
          ? ""
          : "${LocaleKeys.subtitle.tr()}: ${widget.book.subtitle}",
      style: Theme.of(context).textTheme.subtitle1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildBookTitleTextContent(context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.book.title ?? "${LocaleKeys.title.tr()}",
            style: Theme.of(context).textTheme.headline6,
            overflow: TextOverflow.ellipsis,
          ),
          Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}
