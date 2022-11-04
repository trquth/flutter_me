import 'package:flutter/widgets.dart';
import 'package:flutter_complete_guide/sections/todo/models/note.dart';
import 'package:flutter_complete_guide/sections/todo/models/note_data.dart';
import 'package:flutter_complete_guide/sections/todo/widgets/item_tile.dart';
import 'package:provider/provider.dart';

class NoteList extends StatefulWidget {
  final List<Note> _data;
  const NoteList({
    required List<Note> data,
    Key? key,
  })  : _data = data,
        super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, noteData, child) {
        final data = noteData.data;
        //   final data = widget._data;
        if (data.isEmpty) {
          return const Center(
            child: Text('No note'),
          );
        }
        return ListView.builder(
            itemCount: noteData.data.length,
            itemBuilder: (context, index) => ItemTile(
                  data: data[index],
                  updateNoteStatusCallback: (p0) {
                    context.read<NoteData>().updateNote(p0);
                  },
                  deleteNoteCallback: (p0) {
                    context.read<NoteData>().deleteNote(p0);
                  },
                ));
      },
    );
  }
}
