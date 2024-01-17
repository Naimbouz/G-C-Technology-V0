import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

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
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
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
                    title: Text('Task ${index + 1}'),
                    subtitle: Text('Details ${index + 1}'),
                    trailing: Text('21 March'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profil',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),

        ],
      ),
    );
  }
}
