import 'package:flutter/material.dart';
import '../../database/dbHelper.dart';
import '../utils/colors.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // All journals
  List<Map<String, dynamic>> _tasks = [];

  bool _isLoading = true;

  // This function is used to fetch all data from the database
  void _reloadTaskList() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _tasks = data;
      _isLoading = false;
    });
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.blue,
            title: const Text(
              "Do you really want to exit?",
              style: TextStyle(
                fontFamily: 'SourceSerifPro',
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: MColors.noc,
                ),
                onPressed: () => Navigator.pop(context, false),
                //color: MColors.noc,
                child: const Text(
                  "No",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: MColors.yesc,
                ),
                onPressed: () => Navigator.pop(context, true),
                //color: MColors.yesc,
                child: const Text(
                  "Yes",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  void initState() {
    super.initState();
    _reloadTaskList(); // Loading the diary when the app starts
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
          _tasks.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['task'];
      _descriptionController.text = existingJournal['description'];
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  const Text(
                    'Add Tasks',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue,
                      fontFamily: 'PacificoRegular',
                    ),
                  ),
                  TextField(
                    autofocus: true,
                    textAlign: TextAlign.left,
                    onChanged: (newText) {},
                    controller: _titleController,
                    decoration: const InputDecoration(hintText: 'Title'),
                  ),
                  TextField(
                    maxLines: 2,
                    autofocus: true,
                    textAlign: TextAlign.left,
                    onChanged: (newText) {},
                    controller: _descriptionController,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () async {
                      // Save new journal
                      if (id == null) {
                        await _addItem();
                      }

                      if (id != null) {
                        await _updateItem(id);
                      }

                      // Clear the text fields
                      _titleController.text = '';
                      _descriptionController.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: Text(
                      id == null ? 'Save' : 'Update',
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// Insert a new journal to the database
  Future<void> _addItem() async {
    await SQLHelper.createItem(
        _titleController.text, _descriptionController.text);
    _reloadTaskList();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id, _titleController.text, _descriptionController.text);
    _reloadTaskList();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    _reloadTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          centerTitle: true,
          title: const Text(
            "Todom",
            style: TextStyle(
              fontFamily: 'PacificoRegular',
              fontSize: 55,
              color: Colors.blue,
            ),
          ),
          backgroundColor: MColors.appBar,
          elevation: 0,
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Colors.blue,
                  elevation: 0,
                  child: ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(vertical: 4),
                    title: Text(
                      _tasks[index]['task'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'SignikaNegative',
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      _tasks[index]['description'],
                      style: const TextStyle(
                        fontFamily: 'SignikaNegative',
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.done, color: Colors.white, size: 30,
                      ),
                      onPressed: () {
                        _deleteItem(_tasks[index]['id']);
                      },
                    ),
                  ),
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => _showForm(null),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 3.0,
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          color: Colors.blue,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(onPressed: (() {
                AdaptiveTheme.of(context).toggleThemeMode();
              }), icon: const Icon(
                Icons.dark_mode_outlined, size: 30, color: Colors.white,
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
