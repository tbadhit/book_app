import 'dart:ui';

import 'package:book_app/model/book.dart';
import 'package:flutter/material.dart';

// (1) BIKIN STATELESS WIDGET
class DetailScreen extends StatelessWidget {
  DetailScreen({
    Key? key,
    required this.book,
  }) : super(key: key);
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // MEMBUAT APPBAR
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Detail',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      // ----AKHIR MEMBUAT APPBAR----

      // MEMBUAT BODY
      body: SingleChildScrollView(
        child: Column(
          // (Column) MEMBUAT WIDGET MENYUSUN KE BAWAH (VERTICAL)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(book.imageAsset), fit: BoxFit.cover)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: Center(
                    child: Image.asset(
                      book.imageAsset,
                      width: 130,
                    ),
                  ),
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    book.name,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                )),
            Row(
              // (Row) MEMBUAT WIDGET MENYUSUN KE SAMPING (HORIZONTAL)
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(book.rate.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Text('Rating',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))
                  ],
                ),
                Column(
                  children: [
                    Text(book.page.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Text('Page',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))
                  ],
                ),
                Column(
                  children: [
                    Text(book.language,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Text('Language',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                'Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              child: Text(book.desciption, style: TextStyle(fontSize: 18)),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
      // AKHIR MEMBUAT BODY
    );
  }
}
// -------------Akhir (1)----------------------------------------
