import 'package:flutter/material.dart';
import 'package:fibre_workers_management_app/models/task_model.dart';
import 'package:fibre_workers_management_app/services/tasks_service.dart';
import 'package:fibre_workers_management_app/widgets/bottom_navigation_bar.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TasksService tasksService = TasksService('https://6464bd39127ad0b8f8a6981d.mockapi.io/api/todo/travaux');
  late Future<List<TaskModel>> tasks;

  @override
  void initState() {
    super.initState();
    tasks = tasksService.fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                const SizedBox(width: 16.0),
                Text(
                  'lamari lassad',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Add your button press functionality here
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add),
                  const SizedBox(width: 8.0),
                  const Text('Créer une nouvelle tâche'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Add your "Mes Documents" button functionality here
                },
                icon: Icon(Icons.description), // Icon for Mes Documents
                label: Text('Mes Documents'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Add your "Mes Recaps" button functionality here
                },
                icon: Icon(Icons.receipt), // Icon for Mes Recaps
                label: Text('Mes Recaps'),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: FutureBuilder<List<TaskModel>>(
              future: tasks,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      TaskModel task = snapshot.data![index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: index == 0
                                ? Colors.green
                                : index == 1
                                ? Colors.yellowAccent
                                : Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          title: Text(task.titre),
                          subtitle: Text(task.description),
                          trailing: Text('21 March'), // You may need to use task.date or something else
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
