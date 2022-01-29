part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  BookState();

  @override
  List<Object> get props => [];
}

class SearchStateEmpty extends BookState {}

class SearchStateLoading extends BookState {}

class SearchStateSuccess extends BookState {
  final List<Book> items;

  SearchStateSuccess(this.items);

  @override
  List<Object> get props => [items];


}

class SearchStateError extends BookState {
  final String error;

  SearchStateError(this.error);

  @override
  List<Object> get props => [error];
}

