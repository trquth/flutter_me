import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/sections/todo/models/note.dart';
import 'package:flutter_complete_guide/sections/todo/models/note_data.dart';
import 'package:flutter_complete_guide/sections/todo/widgets/add_new_note.dart';
import 'package:flutter_complete_guide/sections/todo/widgets/alert.dart';
import 'package:flutter_complete_guide/sections/todo/widgets/header_todo.dart';
import 'package:flutter_complete_guide/sections/todo/widgets/list_note.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  static const routeName = '/todo_screen';
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Note> _data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderTodo(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: Colors.white),
                child: NoteList(
                  data: Provider.of<NoteData>(context).data,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                      child: Container(
                    child: const AddNewNote(),
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                  )));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}
