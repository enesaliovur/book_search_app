import 'package:dio/dio.dart';

import '../../../../book/models/book_model.dart';

abstract class IBookService {
  final Dio dio;

  IBookService({
    required this.dio,
  });

  Future<List<Book>> fetchBooks(searchTerm);
}
