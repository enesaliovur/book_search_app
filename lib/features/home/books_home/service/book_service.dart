import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../book/models/book_model.dart';
import 'book_service_interface.dart';

class BookService extends IBookService {
  BookService(Dio dio) : super(dio: dio);

  @override
  Future<List<Book>> fetchBooks(searchTerm) async {
    final response = await dio.get(searchTerm);

    if (response.statusCode == HttpStatus.ok) {
      final data = List.from(response.data["items"]);

      final result = data.map((e) => Book.fromJson(e)).toList();

      return result;
    }

    return [];
  }
}
