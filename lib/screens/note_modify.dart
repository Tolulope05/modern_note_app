import 'package:flutter/material.dart';

import '../widgets/text_input_widget.dart';

class NoteModify extends StatelessWidget {
  String? noteId;
  bool get isEditing => noteId != null;
  NoteModify({Key? key, this.noteId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? "Update Note" : "Create Note",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextInputWidget(hintText: "Note title"),
          const TextInputWidget(hintText: "Note content"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Submit",
            ),
          )
        ],
      ),
    );
  }
}
