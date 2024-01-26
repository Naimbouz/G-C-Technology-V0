// tasks_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';

class TasksService {
  final String apiUrl;

  TasksService(this.apiUrl);

  Future<List<TaskModel>> fetchTasks() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((task) => TaskModel.fromJson(task)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }
}
