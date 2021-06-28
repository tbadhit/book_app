import 'package:book_app/model/view_type.dart';

// ISI KODENYA:
// SETELAH DIISI KODENYA SEKARANG PERGI KE FILE "main_screen.dart" DAN ISIKAN KODE YANG DI KOMEN MULAI DARI (1) ->
class MenuItems {
  static const List<ViewType> items = [listView, gridView];

  static const listView = ViewType(title: 'List');
  static const gridView = ViewType(title: 'Grid');
}
