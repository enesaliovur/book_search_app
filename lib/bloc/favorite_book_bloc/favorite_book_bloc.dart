import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../database/book_dao.dart';
import 'package:rxdart/rxdart.dart';

import '../../book/managers/user_manager.dart';
import '../../book/models/book_model.dart';

part 'favorite_book_event.dart';
part 'favorite_book_state.dart';

class FavoriteBookBloc extends Bloc<FavoriteBookEvent, FavoriteBookState> {
  final UserManager userManager;
  final BookDao _bookDao = BookDao();

  FavoriteBookBloc({
    required this.userManager,
  }) : super(FavoriteBooksStateLoading());

  @override
  Stream<Transition<FavoriteBookEvent, FavoriteBookState>> transformEvents(
    Stream<FavoriteBookEvent> events,
    Stream<Transition<FavoriteBookEvent, FavoriteBookState>> Function(
      FavoriteBookEvent event,
    )
        transitionFn,
  ) {
    return events
        .debounceTime(Duration(milliseconds: 300))
        .switchMap(transitionFn);
  }

  @override
  Stream<FavoriteBookState> mapEventToState(FavoriteBookEvent event) async* {
    if (event is LoadFavoriteBook) {
      yield FavoriteBooksStateLoading();
      yield* _reloadFavoriteBooks();
    }

    if (event is AddFavoriteBook) {
      Book book = event.book;

      final favoriteBooks = await _bookDao.getAllFavoriteBooks();
      final result = favoriteBooks
          .where((element) => element.title == book.title)
          .toList();

      if (result.isEmpty) {
        book.isFavorite = true;
        await userManager.addBookToFavorites(book);
        yield* _reloadFavoriteBooks();
      }
    }
    if (event is DeleteFavoriteBook) {
      //Silme işlemi books_favorite_view ekranında çalışıyor
      Book book = event.book;
      book.isFavorite = false;

      await userManager.removeBookToFavorites(book);
      yield* _reloadFavoriteBooks();
    }
  }

  Stream<FavoriteBookState> _reloadFavoriteBooks() async* {
    final favoriteBooks = await _bookDao.getAllFavoriteBooks();

    yield FavoriteBooksStateLoaded(favoriteBooks);
  }
}
