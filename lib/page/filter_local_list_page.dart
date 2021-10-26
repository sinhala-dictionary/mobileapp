import 'package:filter_listview_example/data/book_data.dart';
import 'package:filter_listview_example/main.dart';
import 'package:filter_listview_example/model/book.dart';
import 'package:filter_listview_example/widget/search_widget.dart';
import 'package:flutter/material.dart';

class FilterLocalListPage extends StatefulWidget {
  @override
  FilterLocalListPageState createState() => FilterLocalListPageState();
}

class FilterLocalListPageState extends State<FilterLocalListPage> {
  late List<Word> wordslst;
  String query = '';

  @override
  void initState() {
    super.initState();

    wordslst = allwords;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: wordslst.length,
                itemBuilder: (context, index) {
                  final book = wordslst[index];

                  return buildWord(book, index);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search Word',
        onChanged: searchBook,
      );

  Widget buildWord(Word book, int x) => ListTile(
      title: Text(book.title),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WordDetail(
                  word: wordslst[x],
                )));
      });

  void searchBook(String query) {
    final wordslst = allwords.where((book) {
      final titleLower = book.title.toLowerCase();
      // final authorLower = book.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
      // authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.wordslst = wordslst;
    });
  }
}
