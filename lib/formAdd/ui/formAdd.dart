import 'package:flutter/material.dart';
import 'package:unifranzfind/firebase/firebase_formAdd.dart';
import 'package:unifranzfind/home/ui/home.dart';


class formAdd extends StatefulWidget {
  @override
  _formAddState createState() => _formAddState();
}

class _formAddState extends State<formAdd> {
  TextEditingController myTitulo = TextEditingController();
  TextEditingController myDescripcion = TextEditingController();
  TextEditingController myEstado = TextEditingController();
  TextEditingController myImagenUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: myTitulo,
                  decoration: const InputDecoration(labelText: 'Título'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: myDescripcion,
                  decoration: const InputDecoration(labelText: 'Descripción'),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Estado:'),
                    Switch(
                      value: myEstado.text == "true"? true: false,
                      onChanged: (value) {
                        setState(() {
                          myEstado.text = (value == true? "true":"false");
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: myImagenUrl,
                  decoration: const InputDecoration(labelText: 'Imagen'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    addFormLost(
                      myTitulo.text, 
                      myDescripcion.text, 
                      myEstado.text=="true", 
                      myImagenUrl.text);
                    cargarHome(context);
                  },
                  child: const Text('Guardar'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {    
                    cargarHome(context);
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            ),
        ));
  }
  void cargarHome(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const MyHomePage(title: 'UnifranzFind')),
  );
}
}
