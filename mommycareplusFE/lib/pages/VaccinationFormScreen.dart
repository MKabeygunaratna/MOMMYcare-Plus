import 'package:flutter/material.dart';

void main() {
  runApp(VaccinationFormApp());
}

class VaccinationFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VaccinationFormScreen(),
    );
  }
}

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
            Center(
              child: Text(
                'Vaccination Records',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            _buildTextField('Age', ageController),
            _buildTextField('Type of vaccine', vaccineController),
            _buildTextField('Date', dateController),
            _buildTextField('Batch No', batchController),
            _buildTextField('Adverse effects', effectsController),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: () {},
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
