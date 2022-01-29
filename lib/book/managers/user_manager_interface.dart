import '../models/book_model.dart';

abstract class IUserManager {
  void addBookToFavorites(Book book);
  void removeBookToFavorites(Book book);
}
