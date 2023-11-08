import 'package:flutter/material.dart';
import 'package:unifranzfind/home/ui/home.dart';
import 'package:unifranzfind/login/widgets/Image_login.dart';
import 'package:unifranzfind/login/widgets/Text_login.dart';
import 'package:unifranzfind/login/widgets/button_register.dart';
import 'package:unifranzfind/login/widgets/button_send.dart';
import 'package:unifranzfind/login/widgets/text_field_email.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controllerUser = TextEditingController(text: '');
  final TextEditingController controllerPassword =
      TextEditingController(text: '');

  goHome() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MyHomePage(
                title: "Listado de Objetos Perdidos",
              )),
    );
  }

  @override
  void dispose() {
    // myController.dispose();
    super.dispose();
  }

  void shoDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Mensaje"),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("Aceptar"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(user: controllerUser, password: controllerPassword),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.user,
    required this.password,
  }) : super(key: key);

  final TextEditingController user;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
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
            ])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextLogin(),
              ImageLogin(),
              TextFieldEmail(hint2: "Email", controller: user),
              TextFieldEmail(hint2: "Password", controller: password),
              ButtonSend(buttonText: "Ingresar", user: user, pass: password),
              ButtonRegister(buttonText: "Registrarse"),
            ],
          ),
        ),
      ),
    );
  }
}
