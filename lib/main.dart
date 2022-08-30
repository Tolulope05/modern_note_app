import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:note_app/const/colors.dart';
import 'package:note_app/services/note_services.dart';

import 'screens/note_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  setupLocator();
  runApp(const MyApp());
}

void setupLocator() {
  GetIt.I.registerLazySingleton(() => NoteServices());
  // GetIt.I<NoteServices>();
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
