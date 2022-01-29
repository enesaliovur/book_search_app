import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../book/models/book_model.dart';
import '../../features/home/books_home/service/book_service.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookService bookService;
  



  BookBloc({
    required this.bookService,
  
  }) : super(SearchStateEmpty());

  @override
  Stream<Transition<BookEvent, BookState>> transformEvents(
    Stream<BookEvent> events,
    Stream<Transition<BookEvent, BookState>> Function(
      BookEvent event,
    )
        transitionFn,
  ) {
    return events
        .debounceTime(Duration(milliseconds: 300))
        .switchMap(transitionFn);
  }

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    if (event is TextChanged) {
      final String searchTerm = event.text;
      if (searchTerm.isEmpty) {
        yield SearchStateEmpty();
      } else {
        yield SearchStateLoading();
        try {
          final results = await bookService.fetchBooks(searchTerm);
          yield SearchStateSuccess(results);
        } catch (error) {
          yield SearchStateError('something went wrong');
        }
      }
    }

   

   

}

 
}