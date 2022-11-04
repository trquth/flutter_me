import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/sections/todo/models/note_data.dart';
import 'package:provider/provider.dart';

class HeaderTodo extends StatelessWidget {
  const HeaderTodo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = Provider.of<NoteData>(context).noteCount;
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            child: Icon(
              Icons.list,
              size: 40,
              color: Colors.lightBlueAccent,
            ),
            radius: 30,
            backgroundColor: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'TODO',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text('$count ${count > 1 ? 'Tasks' : 'Task'}',
              style: const TextStyle(fontSize: 12, color: Colors.white))
        ],
      ),
    );
  }
}
