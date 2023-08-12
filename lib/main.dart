import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lib_app/pages/home_page.dart';
import 'constant/hive_constant.dart';
import 'data/vos/home_screen_vo/books_vo.dart';
import 'data/vos/home_screen_vo/buy_links_vo.dart';
import 'data/vos/home_screen_vo/list_vo.dart';
import 'data/vos/search_history_vo/search_history_vo.dart';
import 'data/vos/shelf_book_vo/shelf_book_vo.dart';
import 'package:path_provider/path_provider.dart';


void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // // Initialize Hive
  // try {
  //   final appDocumentDir = await getApplicationDocumentsDirectory();
  //   Hive.init(appDocumentDir.path);
  //
  //   // Register Hive Adapters
  //   Hive.registerAdapter(ListsVOAdapter());
  //   Hive.registerAdapter(BooksVOAdapter());
  //   Hive.registerAdapter(BuyLinksAdapter());
  //   Hive.registerAdapter(ShelfBookVOAdapter());
  //   Hive.registerAdapter(SearchHistoryVOAdapter());
  //
  //   // Open Hive Boxes
  //   await Hive.openBox<ShelfBookVO>(kBoxNameForShelfBooks);
  //   await Hive.openBox<ListsVO>(kOverviewBoxName);
  //   await Hive.openBox<SearchHistoryVO>(kBoxNameForSearchHistory);
  //   await Hive.openBox<ShelfBookVO>('shelfBooks');
  // } catch (e) {
  //   // Handle any exceptions during Hive initialization here
  //   print('Error initializing Hive: $e');
  // }
  //
  // runApp(const MyApp());
  await Hive.initFlutter();

  Hive.registerAdapter(ListsVOAdapter());
  Hive.registerAdapter(BooksVOAdapter());
  Hive.registerAdapter(BuyLinksAdapter());
  Hive.registerAdapter(ShelfBookVOAdapter());
  Hive.registerAdapter(SearchHistoryVOAdapter());

  await Hive.openBox<ShelfBookVO>(kBoxNameForShelfBooks);
  await Hive.openBox<ListsVO>(kOverviewBoxName);
  await Hive.openBox<SearchHistoryVO>(kBoxNameForSearchHistory);


  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Library',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
