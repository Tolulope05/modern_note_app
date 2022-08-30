import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:note_app/services/note_services.dart';

import '../models/note.dart';
import '../widgets/text_input_widget.dart';

class NoteModify extends StatefulWidget {
  String? noteId;
  NoteModify({Key? key, this.noteId}) : super(key: key);

  @override
  State<NoteModify> createState() => _NoteModifyState();
}

class _NoteModifyState extends State<NoteModify> {
  bool get isEditing => widget.noteId != null;

  NoteServices get noteServices => GetIt.I<NoteServices>();

  late String errorMessage;
  late Note note;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    if (widget.noteId != null) {
      noteServices.getNote(widget.noteId!).then((response) {
        if (response.error) {
          errorMessage = response.errorMessage ?? "An Error ocured";
        }
        note = response.data!;
        _titleController.text = note.noteTitle;
        _noteController.text = note.noteContent;
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? "Update Note" : "Create Note",
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextInputWidget(
                  controller: _titleController,
                  hintText: "Note title",
                ),
                TextInputWidget(
                  hintText: "Note content",
                  controller: _noteController,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Submit",
                  ),
                ),
              ],
            ),
    );
  }
}
