import 'package:http/http.dart' as http;
import 'dart:convert';
class TodoApiService {
  final String baseUrl = 'http://10.0.2.2:3000/todo'; // Replace with your actual backend URL

  Future<List<Map<String, dynamic>>> getTasks() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/saved'));
      if (response.statusCode == 200) {
        List<dynamic> tasksJson = jsonDecode(response.body);
        return tasksJson.map((task) => Map<String, dynamic>.from(task)).toList();
      } else {
        throw Exception('Failed to load tasks: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching tasks: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>> addTask(String title, String description, String date, String time) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/add'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'title': title,
          'description': description,
          'date': date,
          'isRecurring': false, // Default value, could be made configurable
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to add task: ${response.statusCode}');
      }
    } catch (e) {
      print('Error adding task: $e');
      throw e;
    }
  }

  Future<void> markTaskAsDone(String title) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/update/$title'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to mark task as done: ${response.statusCode}');
      }
    } catch (e) {
      print('Error marking task as done: $e');
      throw e;
    }
  }

  Future<void> deleteTask(String title) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$title'));

      if (response.statusCode != 200) {
        throw Exception('Failed to delete task: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting task: $e');
      throw e;
    }
  }
}

