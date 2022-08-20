import 'package:flutter/material.dart';
import 'package:note_app/const/colors.dart';

import 'screens/note_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primaryColor,
        secondaryHeaderColor: secondaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: NoteList(),
    );
  }
}
