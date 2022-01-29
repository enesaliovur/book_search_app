part of 'favorite_book_bloc.dart';

abstract class FavoriteBookEvent extends Equatable {
  const FavoriteBookEvent();

  @override
  List<Object> get props => [];
}

class LoadFavoriteBook extends FavoriteBookEvent {}

class AddFavoriteBook extends FavoriteBookEvent {
  final Book book;

  AddFavoriteBook({
    required this.book,
  });
}

class DeleteFavoriteBook extends FavoriteBookEvent {
  final Book book;

  DeleteFavoriteBook({required this.book});
}
