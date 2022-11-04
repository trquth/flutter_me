import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/sections/todo/models/note_data.dart';
import 'package:flutter_complete_guide/sections/todo/widgets/alert.dart';
import 'package:provider/provider.dart';

class AddNewNote extends StatelessWidget {
  const AddNewNote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String note = '';
    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            color: Colors.white),
        padding: const EdgeInsets.all(25),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Text(
            'Add Note',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (text) {
              note = text;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightBlueAccent)),
              onPressed: () {
                if (note.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Alert(
                          description: 'Note is empty. Please input note.');
                    },
                  );
                  return;
                }

                // final _noteData = Note(note: note);
                // Provider.of<NoteData>(context, listen: false)
                //     .data
                //     .add(_noteData);
                Provider.of<NoteData>(context, listen: false).addNote(note);
                Navigator.pop(context);
              },
              child: const Text('Add'))
        ]),
      ),
    );
  }
}
