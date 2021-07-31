import 'package:book_app/model/book.dart';
import 'package:book_app/model/menu_items.dart';
import 'package:book_app/model/view_type.dart';
import 'package:flutter/material.dart';

import 'detail_screen.dart';

// (1) BIKIN STATEFULL WIDGET
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // (2) BIKIN FUNGSI DAN VARIABLE :
  bool isGridView = false;

  // INI FUNGSI UNTUK BIKIN TULISAN "List" dan "Grid" DI MENU KANAN ATAS
  PopupMenuItem<ViewType> buildItem(ViewType type) => PopupMenuItem<ViewType>(
        value: type,
        child: Text(type.title),
      );

  // INI FUNGSI UNTUK UBAH MODE LIST KE GRID
  void onSelected(ViewType type) {
    switch (type) {
      case MenuItems.listView:
        setState(() {
          isGridView = false;
        });
        break;
      case MenuItems.gridView:
        setState(() {
          isGridView = true;
        });
        break;
    }
  }
  //---------------AKHIR (2)----------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // (3) BIKIN APPBAR
      appBar: AppBar(
        // (leading) FUNGSINYA UNTUK BIKIN ICON DI KIRI APPBAR
        leading: Icon(Icons.menu, color: Colors.black),
        // (title) FUNGSINYA UNTUK BIKIN TITLE APPBARNYA
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        // (centerTile) FUNGSINYA UNTUK BIKIN TITLE APPBAR DI TENGAH
        centerTitle: true,
        // (actions) FUNGSINYA UNTUK BIKIN ICON DI SEBELAH KANAN APPBAR
        actions: [
          // (PopupMenuButton) WIDGET YANG DIGUNAKAN UNTUK MENAMPILKAN PILIHAN MODE "List" & "Grid"
          PopupMenuButton<ViewType>(
              onSelected: (type) => onSelected(type),
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              itemBuilder: (context) => [
                    ...MenuItems.items.map(buildItem).toList(),
                  ])
        ],
        // (elevation) FUNGSINYA UNTUK MENGATUR BAYANGAN DARI APPBARNYA
        elevation: 0,
        // (backgroundColor) FUNGSINYA UNTUK MEMBERIKAN WARNA APPBARNYA
        backgroundColor: Colors.white,
      ),
      //----------------AKHIR (3)---------------------------------------

      // (4) MEMBUAT BODY APLIKASI
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('Upgrade your skill\nUpgrade your life',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                      Image.asset(
                        'images/banner.png',
                        width: 100,
                      )
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text('Books',
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600))),
              Container(
                  // PANNGIL WIDGET MODE LIST & GRIDNYA DIBAWAH INI :
                  child: LayoutBuilder(
                builder: (context, BoxConstraints constrains) {
                  if (constrains.maxWidth <= 600) {
                    return isGridView
                        ? buildGridView(context, 2)
                        : buildListView();
                  } else if (constrains.maxWidth <= 1200) {
                    return buildGridView(context, 4);
                  } else {
                    return buildGridView(context, 6);
                  }
                },
              ))
            ],
          ),
        ),
      ),
      //---------------Akhir (4)--------------------
    );
  }

  // (5) BIKIN WIDGET UNTUK MODE LISTNYA
  ListView buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listBook.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          // MEMBUAT FUNGSI KETIKA CARDNYA DI KLIK DIA PINDAH KE HALAMAN DETAIL
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(
                book: listBook[index],
              );
            }));
          },
          //---------------
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      listBook[index].imageAsset,
                      width: 64,
                      height: 64,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(listBook[index].name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                        Text(listBook[index].categoryBook,
                            style: TextStyle(fontSize: 20))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  //----------Akhir (5)-------------------------------------

  // (6) BIKIN WIDGET UNTUK MODE LISTNYA
  GridView buildGridView(BuildContext context, int gridCount) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: gridCount,
      children: List.generate(listBook.length, (index) {
        return InkWell(
          // MEMBUAT FUNGSI KETIKA CARDNYA DI KLIK DIA PINDAH KE HALAMAN DETAIL
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(
                book: listBook[index],
              );
            }));
          },
          //------------------------------
          child: Card(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 50, right: 50),
                    child: Image.asset(
                      listBook[index].imageAsset,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          listBook[index].name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        listBook[index].categoryBook,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
  //----------Akhir (6)-------------------------------------
  // SETELAH SELESAI DI KODE YANG DI KOMEN (6), SEKARANG PERGI KE FILE "detail_screen.dart" DAN ISIKAN KODE YANG DI KOMEN MULAI DARI (1)->
}
