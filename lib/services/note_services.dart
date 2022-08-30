import 'dart:convert';

import 'package:note_app/models/api_response.dart';
import 'package:http/http.dart' as http;

import '../models/note_for_listing.dart';

class NoteServices {
  static const url = "api.notes.programmingaddict.com";
  static const headers = <String, String>{
    'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
  };

  Future<APIResponse<List<NoteForListing>>> getNoteList() async {
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
            createdTime: DateTime.parse(item['createdTime']),
            lastEditDateTime: DateTime.parse(
              item['createdTime'] ?? null,
            ),
          );
          notes.add(note);
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

  String getFormattedDateTime(DateTime date) {
    return '${date.day}/${date.month}/${date.year}  ${date.hour}:${date.minute}';
  }
}
