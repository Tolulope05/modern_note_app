import 'dart:convert';

import 'package:note_app/models/api_response.dart';
import 'package:http/http.dart' as http;

import '../models/note.dart';
import '../models/note_for_listing.dart';

class NoteServices {
  static const url = "htttp://api.notes.programmingaddict.com";
  static const headers = <String, String>{
    'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
  };

  Future<APIResponse<List<NoteForListing>>> getNoteList() async {
    print("Got here");
    return http
        .get(
      Uri.parse("$url/notes"),
      headers: headers,
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final List<NoteForListing> notes = <NoteForListing>[];
        for (var item in jsonData) {
          final note = NoteForListing(
            noteId: item['noteID'],
            noteTitle: item['noteTitle'],
            createDateTime: DateTime.parse(item['createDateTime']),
            lastEditDateTime: DateTime.parse(
              item['lastEditDateTime'] ?? item['createDateTime'],
            ),
          );
          notes.add(note);
          print("success");
        }

        return APIResponse<List<NoteForListing>>(
          data: notes,
        );
      }

      return APIResponse<List<NoteForListing>>(
        error: true,
        errorMessage: "An error occured",
        data: <NoteForListing>[],
      );
    }).catchError(
      (_) => APIResponse<List<NoteForListing>>(
        error: true,
        errorMessage: "An error occured",
        data: <NoteForListing>[],
      ),
    );
  }

  Future<APIResponse<Note>> getNote(String noteId) async {
    return http
        .get(
      Uri.parse("$url/notes/$noteId"),
      headers: headers,
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final Note notes = Note(
          noteId: jsonData['noteID'],
          noteTitle: jsonData['noteTitle'],
          noteDetails: jsonData['noteDetails'],
          createDateTime: DateTime.parse(jsonData['createDateTime']),
          lastEditDateTime: DateTime.parse(
            jsonData['lastEditDateTime'] ?? jsonData['createDateTime'],
          ),
        );
        print("success");
        return APIResponse(
          data: notes,
        );
      }
      return APIResponse(
        error: true,
        errorMessage: "An Error occured",
      );
    });
  }

  String getFormattedDateTime(DateTime date) {
    return '${date.day}/${date.month}/${date.year}  ${date.hour}:${date.minute}';
  }
}
