import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:note_app/const/colors.dart';
import 'package:note_app/models/api_response.dart';
import 'package:note_app/models/note_for_listing.dart';
import 'package:note_app/services/note_services.dart';
import 'package:note_app/widgets/note_delete_dialogue.dart';
import 'package:note_app/screens/note_modify.dart';

class NoteList extends StatefulWidget {
  NoteList({
    Key? key,
  }) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NoteServices get service => GetIt.I<NoteServices>();

  String dateConverter(DateTime date) {
    return service.getFormattedDateTime(date);
  }

  late APIResponse<List<NoteForListing>> _apiResponse;

  bool _isLoading = true;

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  void _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });
    _apiResponse = await service.getNoteList();
    print(_apiResponse.data); // My guy dey return empty map
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List of Note")),
      body: Builder(builder: (context) {
        if (_isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (_apiResponse.error) {
          Center(
            child: Text(_apiResponse.errorMessage!),
          );
        }
        return ListView.separated(
          itemBuilder: ((context, index) {
            return Dismissible(
              key: ValueKey(_apiResponse.data![index].noteId),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {},
              confirmDismiss: (direction) async {
                final result = await showDialog(
                  context: context,
                  builder: (_) => const NoteDeleteDialogue(),
                );
                print(result);
                return result;
              },
              background: Container(
                color: dismissibleBg,
                padding: const EdgeInsets.only(left: 18),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.delete),
                ),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => NoteModify(
                            noteId: _apiResponse.data![index].noteId,
                          ),
                        ),
                      )
                      .then(
                        (value) =>
                            _fetchNotes(), // To refresh screen as a new note is updated.
                      );
                },
                title: Text(
                  _apiResponse.data![index].noteTitle,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: Text(
                  dateConverter(_apiResponse.data![index].lastEditDateTime),
                  style:
                      TextStyle(color: Theme.of(context).secondaryHeaderColor),
                ),
              ),
            );
          }),
          separatorBuilder: (_, __) => Container(
            height: 1,
            color: greyColor,
          ),
          itemCount: _apiResponse.data!.length,
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(builder: (context) => NoteModify()),
              )
              .then(
                (value) =>
                    _fetchNotes(), // To refresh screen as a new note is updated.
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
