import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 32.0,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            SizedBox(height: 4.0),
            TextField(
                autofocus: true,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.lightBlueAccent,
                ),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 4.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 4.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 4.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                )),
            SizedBox(height: 24.0),
            FlatButton(
              color: Colors.lightBlueAccent,
              onPressed: () {},
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ]),
    );
  }
}