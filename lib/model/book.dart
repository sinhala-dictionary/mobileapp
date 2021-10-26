import 'package:flutter/material.dart';

class Word {
  final String title;
  final String postag;
  final String definition;

  const Word({
    required this.title,
    required this.postag,
    required this.definition,
  });
  factory Word.fromJson(Map<String, dynamic> json) => Word(
        title: json['title'],
        postag: json['postag'],
        definition: json['definition'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'postag': postag,
        'definition': definition,
      };
}

//building the word view
class WordDetail extends StatelessWidget {
  final Word word;

  const WordDetail({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Results'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                word.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(word.postag),
              Text(word.definition),
            ],
          ),
        ));
  }
}
