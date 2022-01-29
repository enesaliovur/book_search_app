import '../../database/book_dao.dart';

import 'user_manager_interface.dart';
import '../models/book_model.dart';


class UserManager implements IUserManager {
 final BookDao _bookDao = BookDao();

  @override
  Future<void> addBookToFavorites(Book book) async {
    await _bookDao.insert(book);
  }

  @override
  Future<void> removeBookToFavorites(Book book) async {
    await _bookDao.delete(book);
  }
}
