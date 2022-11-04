import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/sections/todo/models/note.dart';
import 'package:flutter_complete_guide/sections/todo/models/note_data.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {
  final Note _data;
  final Function(Note)? _updateNoteStatusCallback;
  final Function(Note)? _deleteNoteCallback;

  const ItemTile({
    required Note data,
    Function(Note)? updateNoteStatusCallback,
    Function(Note)? deleteNoteCallback,
    Key? key,
  })  : _data = data,
        _updateNoteStatusCallback = updateNoteStatusCallback,
        _deleteNoteCallback = deleteNoteCallback,
        super(key: key);

  void action(final Note data) {
    final action = _updateNoteStatusCallback;
    if (action != null) {
      action(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: Text(
          _data.note,
          style: TextStyle(
              decoration: _data.isChecked
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Checkbox(
          value: _data.isChecked,
          onChanged: (value) {
            action(_data);
          },
        ),
      ),
      onTap: () {
        action(_data);
      },
      onLongPress: () {
        final action = _deleteNoteCallback;
        if (action != null) {
          action(_data);
        }
      },
    );
  }
}
