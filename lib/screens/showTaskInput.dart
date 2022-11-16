import 'package:flutter/material.dart';
import '../utils/colors.dart';

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Tasks',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: MColors.mainc,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.left,
              onChanged: (newText) {},
              decoration: InputDecoration(
                  hintText: "Task"
              ),
            ),
            TextField(
              maxLines: 2,
              autofocus: true,
              textAlign: TextAlign.left,
              onChanged: (newText) {},
              decoration: InputDecoration(
                hintText: "Description",
              ),
            ),
            TextButton(
              child: Text(
                'Save',
                style: TextStyle(color: MColors.cream),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MColors.mainc),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}