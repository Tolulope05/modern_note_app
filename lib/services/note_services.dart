import 'dart:convert';

import 'package:note_app/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:note_app/models/note_insert.dart';

import '../models/note.dart';
import '../models/note_for_listing.dart';

class NoteServices {
  static const url = "http://api.notes.programmingaddict.com";
  static const headers = <String, String>{
    'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json',
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
          final note = NoteForListing.fromJson(item);
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

  Future<APIResponse<Note>> getNote(String noteId) async {
    return http
        .get(
      Uri.parse("$url/notes/$noteId"),
      headers: headers,
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final Note notes = Note.fromJson(jsonData);
        return APIResponse<Note>(
          data: notes,
        );
      }
      return APIResponse<Note>(
        error: true,
        errorMessage: "An Error occured",
      );
    });
  }

  Future<APIResponse<bool>> createNote(NoteInsert note) async {
    return http
        .post(
      Uri.parse("$url/notes"),
      headers: headers,
      body: json.encode(
        note.toJson(),
      ),
    )
        .then((data) {
      print(data.statusCode);
      print(data.body);
      if (data.statusCode == 201) {
        return APIResponse<bool>(
          data: true,
        );
      }
      return APIResponse<bool>(data: false, error: true);
    }).onError((error, stackTrace) {
      print(error);
      return APIResponse<bool>(data: false, error: true);
    });
  }

  Future<APIResponse<bool>> updateNote(String noteId, NoteInsert note) async {
    return http
        .put(
      Uri.parse("$url/notes/$noteId"),
      headers: headers,
      body: json.encode(
        note.toJson(),
      ),
    )
        .then((data) {
      print(data.statusCode);
      print(data.body);
      if (data.statusCode == 204) {
        return APIResponse<bool>(
          data: true,
        );
      }
      return APIResponse<bool>(data: false);
    }).onError((error, stackTrace) {
      print(error);
      return APIResponse<bool>(
        data: false,
      );
    });
  }

  Future<APIResponse<bool>> deleteNote(String noteId) async {
    return http
        .delete(
      Uri.parse("$url/notes/$noteId"),
      headers: headers,
    )
        .then((data) {
      print(data.statusCode);
      print(data.body);
      if (data.statusCode == 204) {
        return APIResponse<bool>(
          data: true,
        );
      }
      return APIResponse<bool>(data: false);
    }).onError((error, stackTrace) {
      print(error);
      return APIResponse<bool>(
        data: false,
      );
    });
  }

  String getFormattedDateTime(DateTime date) {
    return '${date.day}/${date.month}/${date.year}  ${date.hour}:${date.minute}';
  }
}
