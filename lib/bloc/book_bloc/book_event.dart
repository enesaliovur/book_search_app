part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  BookEvent();
}

class TextChanged extends BookEvent {
  final String text;

  TextChanged({required this.text});

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}


