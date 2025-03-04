import 'package:flutter/material.dart';

class VaccinationFormScreen extends StatelessWidget {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController vaccineController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController batchController = TextEditingController();
  final TextEditingController effectsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Age"),
            TextField(controller: ageController),
            Text("Type of vaccine"),
            TextField(controller: vaccineController),
            Text("Date"),
            TextField(controller: dateController),
            Text("Batch No"),
            TextField(controller: batchController),
            Text("Adverse effects"),
            TextField(controller: effectsController),
          ],
        ),
      ),
    );
  }
}
