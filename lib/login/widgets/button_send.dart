import 'package:flutter/material.dart';
import 'package:unifranzfind/firebase/firebase_firestore.dart';
import 'package:unifranzfind/home/ui/home.dart';

class ButtonSend extends StatelessWidget {
  String buttonText = "Navigate";

  // final VoidCallback onPressed;
  final TextEditingController user;
  final TextEditingController pass;

  ButtonSend(
      {Key? key,
      required this.buttonText,
      required this.user,
      required this.pass})
      : super(key: key);

  void _showAlert(BuildContext context) {
    ScaffoldMessenger.of(context)
        .hideCurrentSnackBar(); // Hide any previous snackbar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      // Show a new snackbar
      content: const Text('Ocurrio un Error al intentar loguearse'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    //final loginBloc = BlocProvider.of<LoginBloc>(context);
    Future<void> goHome() async {
      bool verificar = await UsersUtilidades().verifyUser(user.text, pass.text);
      if (verificar) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                    title: "hola",
                  )),
        );
      } else {
        _showAlert(context);
      }
    }

    return InkWell(
      onTap: () => {goHome()}, //onPressed,
      child: Container(
        margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        height: 50.0,
        width: 180.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: const LinearGradient(
                colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
                fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
          ),
        ),
      ),
    );
  }
}
