import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:intl/intl.dart'; // Format Dates

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(primarySwatch: Colors.blue, bottomAppBarColor: Colors.blue),
      home: EditJournal(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Database _database;

  Future<List<Journal>> _loadJournals() async {
    await DatabaseFileRoutines().readJournals().then((journalJson) {
      _database = databaseFromJson(journalJson);
      _database.journal
          .sort((comp1, comp2) => comp1.date.compareTo(comp2.date));
    });
    return _database.journal;
  }

  void _addOrEditJournal(
      {required bool add, required int index, required Journal journal}) {
    JournalEdit _journalEidt = JournalEdit(action: "", journal: journal);
    setState(() {
      _database.journal.add(_journalEidt.journal);
    });
    DatabaseFileRoutines().writeJournals(databaseToJson(_database));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Persistence")),
      body: FutureBuilder(
        initialData: [],
        future: _loadJournals(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _buildListViewSeparated(snapshot);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.all(24.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Journal Entry",
        child: Icon(Icons.add),
        onPressed: () async {
          _addOrEditJournal(
              add: true,
              index: -1,
              journal: Journal(
                  id: "1", date: "2022/03/03", mood: "Yeh", note: "Yeh"));
        },
      ),
    );
  }

  Widget _buildListViewSeparated(AsyncSnapshot snapshot) {
    return ListView.separated(
        itemBuilder: (context, index) {
          String _date = DateFormat.yMMMd().format(DateTime.now());
          String _subtitle =
              snapshot.data[index].mood + "\n" + snapshot.data[index].note;

          return Dismissible(
            key: Key(snapshot.data[index].id),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              leading: Column(
                children: [
                  Text(
                    DateFormat.d().format(DateTime.now()),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.blue),
                  ),
                  Text(
                    DateFormat.E().format(DateTime.now()),
                  )
                ],
              ),
              title: Text(
                DateFormat.yMMMd().format(DateTime.now()),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_subtitle),
              onTap: () {
                print("on tap");
              },
            ),
            onDismissed: (direction) {
              setState(() {
                _database.journal.removeAt(index);
              });
              DatabaseFileRoutines().writeJournals(databaseToJson(_database));
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(color: Colors.grey);
        },
        itemCount: snapshot.data.length);
  }
}

class EditJournal extends StatefulWidget {
  const EditJournal({Key? key}) : super(key: key);

  @override
  State<EditJournal> createState() => _EditJournalState();
}

class _EditJournalState extends State<EditJournal> {
  late JournalEdit _journalEdit;
  late String _title;
  late DateTime _selectedDate;
  TextEditingController _moodCtrl = TextEditingController();
  TextEditingController _noteCtrl = TextEditingController();
  FocusNode _moodFocus = FocusNode();
  FocusNode _noteFocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _journalEdit = JournalEdit(
        action: 'Cancel',
        journal: Journal(
            id: "1", date: "2020/03/03", mood: "Test Mood", note: "Test Note"));
    _title = "Add";
    _selectedDate = DateTime.now();
    _moodCtrl.text = "";
    _noteCtrl.text = "";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _moodCtrl.dispose();
    _noteCtrl.dispose();
    _moodFocus.dispose();
    _noteFocus.dispose();

    super.dispose();
  }

  Future<DateTime> _selectDate(
      BuildContext context, DateTime selectedDate) async {
    DateTime _initialDate = selectedDate;

    final DateTime? _pickedDate = await showDatePicker(
      context: context,
      initialDate: _initialDate,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (_pickedDate != null) {
      selectedDate = DateTime(
          _pickedDate.year,
          _pickedDate.month,
          _pickedDate.day,
          _initialDate.hour,
          _initialDate.minute,
          _initialDate.second,
          _initialDate.millisecond,
          _initialDate.microsecond);
    }
    return selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$_title Entry'),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                  onPressed: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    DateTime _pickerDate =
                        await _selectDate(context, _selectedDate);
                    setState(() {
                      _selectedDate = _pickerDate;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        DateFormat.yMMMMEEEEd().format(_selectedDate),
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black54,
                      )
                    ],
                  )),
              TextField(
                controller: _moodCtrl,
                focusNode: _moodFocus,
                decoration:
                    InputDecoration(labelText: "Mood", icon: Icon(Icons.mood)),
                textInputAction: TextInputAction.next,
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                onSubmitted: (value) {},
              ),
              TextField(
                controller: _noteCtrl,
                focusNode: _noteFocus,
                decoration: InputDecoration(
                    labelText: "Note", icon: Icon(Icons.subject)),
                textInputAction: TextInputAction.newline,
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                maxLines: null,
                onSubmitted: (value) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {}, child: Text("Cancel")),
                  SizedBox(
                    width: 8.0,
                  ),
                  TextButton(
                      onPressed: () {
                        debugPrint(_moodCtrl.text);
                      },
                      child: Text("Save")),
                ],
              )
            ],
          ),
        )));
  }
}

// Class

class DatabaseFileRoutines {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/local_persistence.json');
  }

  Future<String> readJournals() async {
    try {
      final file = await _localFile;

      if (!file.existsSync()) {
        print("File does not Exist: ${file.absolute}");
        await writeJournals('{"journals": []}');
      }

      // Read the file
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      print("error readJournals: $e");
      return "";
    }
  }

  Future<File> writeJournals(String json) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$json');
  }
}

// Local Storage JSON Database file and Journal Class
// To read and parse from JSON data - databaseFromJson(jsonString);
// To save and parse to JSON Data - databaseToJson(jsonString);

Database databaseFromJson(String str) {
  final dataFromJson = json.decode(str);
  return Database.fromJson(dataFromJson);
}

String databaseToJson(Database data) {
  final dataToJson = data.toJson();
  return json.encode(dataToJson);
}

class Database {
  List<Journal> journal;

  Database({
    required this.journal,
  });

  factory Database.fromJson(Map<String, dynamic> json) => Database(
        journal: List<Journal>.from(
            json["journals"].map((x) => Journal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "journals": List<dynamic>.from(journal.map((x) => x.toJson())),
      };
}

class Journal {
  String id;
  String date;
  String mood;
  String note;

  Journal({
    required this.id,
    required this.date,
    required this.mood,
    required this.note,
  });

  factory Journal.fromJson(Map<String, dynamic> json) => Journal(
        id: json["id"],
        date: json["date"],
        mood: json["mood"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "mood": mood,
        "note": note,
      };
}

// Used for Data Entry to pass between pages
class JournalEdit {
  String action;
  Journal journal;

  JournalEdit({required this.action, required this.journal});
}
