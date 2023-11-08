import 'package:flutter/material.dart';
import 'package:unifranzfind/firebase/firebase_firestore.dart';

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
          future: getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  String title = snapshot.data![index]['title']; 
                  String description = snapshot.data![index]['description']; 
                  String imageUrl = snapshot.data![index]['imageUrl']; 
                  bool state = snapshot.data![index]['state']; 
                  return ListTile(
                    title: Text(title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(description),
                        Text(state == true? "Activo": "Inacti"),
                      ]
                      ),
                    leading: Image.network(
                      imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
