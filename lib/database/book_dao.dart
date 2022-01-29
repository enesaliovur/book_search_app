import '../core/constants/app_constants.dart';
import '../book/models/book_model.dart';
import 'app_database.dart';
import 'package:sembast/sembast.dart';

class BookDao {
  final _favoriteBookStore =
      intMapStoreFactory.store(AppConstants.FAVORITE_BOOK_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Book book) async {
    await _favoriteBookStore.add(await _db, book.toMap());
  }

  Future delete(Book book) async {
    final finder = Finder(filter: Filter.byKey(book.id));
    await _favoriteBookStore.delete(await _db, finder: finder);
  }

  Future<List<Book>> getAllFavoriteBooks() async {
    final finder = Finder(sortOrders: [SortOrder('title')]);
    final recordSnapshots =
        await _favoriteBookStore.find(await _db, finder: finder);

    return recordSnapshots.map((snapshot) {
      final book = Book.fromMap(snapshot.value);
      book.id = snapshot.key;
      return book;
    }).toList();
  }
}
