// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AddTaskMenu extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AddTaskMenuState createState() => _AddTaskMenuState();
}

class _AddTaskMenuState extends State<AddTaskMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.background,
      appBar: AppBar(
        toolbarHeight: 55,
        centerTitle: true,
        title: const Text(
          "Add task",
          style: TextStyle(
            fontFamily: 'SourceSerifPro',
            fontSize: 40,
            color: MColors.titlec,
          ),
        ),
        backgroundColor: MColors.mainc,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Container(
                  height: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: MColors.mainc),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Task',
                    hintText: 'Save your task here!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                maxLines: 8,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: MColors.mainc),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Description',
                    hintText: 'Details about the task'),
              ),
            ),
            Center(
              child: Container(
                height: 20,
              ),
            ),
            Container(
              width: 320,
              margin: const EdgeInsets.all(25),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 140,
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: MColors.mainc,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: MColors.cream,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: MColors.noc,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: MColors.cream,
                        ),
                      ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
