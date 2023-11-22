import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:unifranzfind/uploads/services/image_picker.dart';
import 'package:unifranzfind/uploads/services/subir_imagen.dart';

class RegistroImagen extends StatefulWidget {
  const RegistroImagen({super.key});

  @override
  State<RegistroImagen> createState() => _RegistroImagenState();
}

class _RegistroImagenState extends State<RegistroImagen> {
 File? imagen_to_upload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro de imagenes"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
         gradient: LinearGradient(
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
            colors: [
             Color(0xff584CD1),
             Color(0xcc584CD1),
             Color(0xcc4268D3),
             Color(0xff4268D3),
            ]
          )
        ),
        child: Column(
          children: [
            imagen_to_upload !=null ? Image.file(imagen_to_upload!) : Container(
              height: 200,
              margin: const EdgeInsets.all(15),
              width: double.infinity,
              color: Colors.cyan,
            ),
            ElevatedButton(onPressed:() async {
              final imagen = await getImage();
              setState(() {
                imagen_to_upload = File(imagen!.path);
              });

            }, 
            
            child: const Text("Selecionar imagen de galeria")),
            ElevatedButton(onPressed:() async {
              final imagen = await getCamera();
              setState(() {
                imagen_to_upload = File(imagen!.path);
              });

            }, 
            
            child: const Text("Tomar foto de camara")),
            ElevatedButton(onPressed:() async {
              if (imagen_to_upload == null) {
                return;
              }
              final uoload =await uploadImage(imagen_to_upload!);
              if (uoload) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("error al subir la imagen"))
                );
              }
              else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("La imagen se subio correctamente"))
                );
              }

            }, child: const Text("subir imagen a firebase")),
          ],
        ),
      )
    );
  }
}