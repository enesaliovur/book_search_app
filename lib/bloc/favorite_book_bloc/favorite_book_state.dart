part of 'favorite_book_bloc.dart';

abstract class FavoriteBookState extends Equatable {
  const FavoriteBookState();
  
  @override
  List<Object> get props => [];
}


class FavoriteBooksStateLoading extends FavoriteBookState {}

class FavoriteBooksStateLoaded extends FavoriteBookState {
  final List<Book> books;

  FavoriteBooksStateLoaded(this.books);
    @override
  List<Object> get props => [books];
}

