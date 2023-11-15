import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<void> addFormLost(String titulo, String descripcion, bool estado, String imagenUrl) async {
  CollectionReference collectionReference = db.collection('objectlost');
  
  await collectionReference.add({
    'titulo': titulo,
    'descripcion': descripcion,
    'estado': estado,
    'imagenUrl': imagenUrl,
  });
}

Future<List> getFormLost() async {
  List datas = [];
  CollectionReference collectionReference = db.collection('objectlost');
  QuerySnapshot querySnapshot = await collectionReference.get();
  querySnapshot.docs.forEach((element) {
    datas.add(element.data());
  });
  return datas;
}
