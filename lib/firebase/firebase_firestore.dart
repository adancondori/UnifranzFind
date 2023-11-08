import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
class UsersUtilidades{ 
FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUsers() async {
  List datas = [];
  CollectionReference collectionReference = db.collection('users');
  QuerySnapshot querySnapshot = await collectionReference.get();
  querySnapshot.docs.forEach((element) {
    datas.add(element.data());
  });
  return datas;
}

Future<bool> saveUsers(String name, String password, String phone, String email, String sede)async{
  try {
    await FirebaseDatabase.instance
   .reference()
   .child('usuarios')
   .push()
   .set({ 'name': name, 'password': password, 'phone': phone, 'email': email, 'sede': sede});
   return true;
    
  } catch (e) {
    print(e);
    return false;
    
  }
   
  }
 }
