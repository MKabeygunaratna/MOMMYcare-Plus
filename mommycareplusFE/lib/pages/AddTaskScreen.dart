import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Add Task'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Topic"),
            TextField(),
            SizedBox(height: 16),
            Text("Description"),
            TextField(maxLines: 4),
            SizedBox(height: 16),
            Text("Date"),
            TextField(),
            SizedBox(height: 16),
            Text("Time"),
            TextField(),
          ],
        ),
      ),
    );
  }
}
