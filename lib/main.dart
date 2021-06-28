import 'package:book_app/detail_screen.dart';
import 'package:book_app/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// START
// 1. BIKIN KODE DI BAWAH
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: MainScreen(),
    );
  }
}
// SETELAH BIKIN KODE DI ATAS, SEKARANG BIKIN BEBERAPA FOLDER DAN FILE BARU :
// 1. "main_screen.dart" (FILE)
// 2. "detail_screen.dart" (FILE)
// 3. "model" (FOLDER)
// 4. "book.dart" (BIKIN DI DALAM FOLDER "model")
// 5. "menu_items.dart"(BIKIN DI DALAM FOLDER "model")
// 6. "view_type.dart" (BIKIN DI DALAM FOLDER "model")
// SETELAH BIKIN FILE DAN FOLDERNYA SEKARANG MASUK KE DALAM FILE "book.dart" dan isikan kode didalamnya ->
