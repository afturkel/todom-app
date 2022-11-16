// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/todo_service.dart';
import '../screens/showTaskInput.dart';
import '../utils/colors.dart';
import '../models/todo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoService service = TodoService();
  List<Todo> todos = [];

  void initState() {
    loadData();
    super.initState();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: MColors.mainc,
            title: const Text(
              "Do you really want to exit?",
              style: TextStyle(
                fontFamily: 'SourceSerifPro',
                color: MColors.cream,
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
                    color: MColors.cream,
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
                    color: MColors.cream,
                  ),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: MColors.background,
        appBar: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          title: const Text(
            "Todom",
            style: TextStyle(
              fontFamily: 'SourceSerifPro',
              fontSize: 40,
              color: MColors.mainc,
            ),
          ),
          backgroundColor: MColors.appBar,
          elevation: 0,
        ),
        body: getTodoList(todos),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: MColors.mainc,
          child: const Icon(
            Icons.add,
            color: MColors.titlec,
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: BottomSheetExample(),
                  ),
                ),
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 2.0,
          shape: const CircularNotchedRectangle(),
          color: MColors.mainc,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 40.0,
                width: 50,
              ),
              Text(
                DateFormat('H:m - d/MM/yyyy').format(DateTime.now()),
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'SourceSerifPro',
                  color: MColors.titlec,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTodoList(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: MColors.mainc,
          elevation: 0,
          child: ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: 4),
            title: Text(
              todos[index].title,
              style: const TextStyle(
                color: MColors.cream,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              todos[index].description,
              style: const TextStyle(color: MColors.cream, fontSize: 15),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.done, color: MColors.cream),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }

  loadData() {
    setState(() {
      todos = TodoService.getTodos();
    });
  }
}
