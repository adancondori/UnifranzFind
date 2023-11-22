import 'package:flutter/material.dart';
import 'package:unifranzfind/firebase/firebase_firestore.dart';
import 'package:unifranzfind/firebase/firebase_formAdd.dart';
import 'package:unifranzfind/formAdd/ui/formAdd.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UnifranzFind'),
      ),
      body: FutureBuilder(
          future: getFormLost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  String title = snapshot.data![index]['title'];
                  String description = snapshot.data![index]['description'];
                  String imageUrl = snapshot.data![index]['imageUrl'];
                  bool state = snapshot.data![index]['state'];

                  return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      title: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            description,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            state == true ? "Activo" : "Inactivo",
                            style: TextStyle(
                              color: state == true ? Colors.green : Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      /*leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          imageUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),*/
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => formAdd()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}