import 'package:flutter/material.dart';
import '../utils/colors.dart';

class EditTask extends StatefulWidget {
  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.background,
      appBar: AppBar(
        toolbarHeight: 55,
        centerTitle: true,
        title: const Text(
          "View task",
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
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: MColors.mainc),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Task',
                    hintText: 'Edit your task here!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: MColors.mainc),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Description',
                    hintText: 'Details'),
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
                        'Delete',
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
