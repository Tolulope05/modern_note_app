import 'package:flutter/material.dart';
import 'package:note_app/const/colors.dart';

import '../widgets/text_input_widget.dart';

class NoteModify extends StatelessWidget {
  const NoteModify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Note"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextInputWidget(hintText: "Note title"),
          const TextInputWidget(hintText: "Note content"),
          ElevatedButton(onPressed: () {}, child: const Text("Submit"))
        ],
      ),
    );
  }
}
