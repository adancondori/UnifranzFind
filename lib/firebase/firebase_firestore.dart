import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class UsersUtilidades {
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

  Future<bool> saveUsers(String name, String password, String phone,
      String email, String sede) async {
    try {
      await FirebaseDatabase.instance.ref().child('usuarios').push().set({
        'name': name,
        'password': password,
        'phone': phone,
        'email': email,
        'sede': sede
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> verifyUser(String email, String password) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    final snapshot = await databaseReference
        .child('usuarios')
        .orderByChild('email')
        .equalTo(email)
        .once();
    if (snapshot.snapshot.value != null) {
      for (final childSnapshot in snapshot.snapshot.children) {
        if (childSnapshot.child('password').value == password &&
            childSnapshot.child('email').value == email) {
          return true;
        }
      }
    }
    return false;
  }
}
