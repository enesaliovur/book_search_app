import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'bloc/favorite_book_bloc/favorite_book_bloc.dart';

import 'bloc/book_bloc/book_bloc.dart';
import 'book/managers/user_manager.dart';
import 'core/constants/app_constants.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/network/network_manager.dart';
import 'core/init/theme/app_theme.dart';
import 'features/home/books_home/service/book_service.dart';
import 'features/home/books_home/view/books_home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  return runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: AppConstants.LANG_ASSETS_PATH,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BookBloc>(
            create: (BuildContext context) => BookBloc(
              bookService: BookService(NetworkManager.instance.dio),
            ),
          ),
          BlocProvider<FavoriteBookBloc>(
            create: (BuildContext context) =>
                FavoriteBookBloc(userManager: UserManager()),
          ),
        ],
        child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: appThemeData,
            home: HomeView()));
  }
}
