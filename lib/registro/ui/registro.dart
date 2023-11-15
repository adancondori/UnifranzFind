import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:unifranzfind/firebase/firebase_firestore.dart';

class RegistroApp extends StatefulWidget {
  const RegistroApp({super.key});

  @override
  State<RegistroApp> createState() => __RegistroAppState();
}

class __RegistroAppState extends State<RegistroApp> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _ConfirmpassController = TextEditingController();
  final TextEditingController _telefono = TextEditingController();
  final TextEditingController _Email = TextEditingController();
  TextEditingController dropdownController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> sedes = ['Santa Cruz', 'Cochabamba', 'La Paz', 'El Alto'];

  @override
  void dispose() {
    dropdownController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    dropdownController.text = sedes[0];
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registro"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 218, 144, 95),
                  Color.fromARGB(255, 227, 113, 13)
                ], // Colores del degradado
                begin:
                    Alignment.centerLeft, // Inicio del degradado a la izquierda
                end: Alignment.centerRight, // Fin del degradado a la derecha
              ),
            ),
            child: Container(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              decoration: BoxDecoration(
                color: Colors.white38.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(
                        255, 42, 9, 9), // Color de la sombra
                    offset: Offset(0, 4), // Desplazamiento en x e y
                    blurRadius: 10, // Radio de difuminación
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Container(
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unifranz.png",
                        height: 200.0,
                        width: 200.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                      ),
                    ),
                    TextFormField(
                      controller: _nombreController,
                      validator: (String? dato) {
                        if (dato!.isEmpty) {
                          return 'Este campo es obligatorio';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Nombre:",
                        suffixIcon: Icon(Icons.verified_user),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      controller: _passController,
                      enableInteractiveSelection: false,
                      obscureText: true,
                      validator: (String? dato) {
                        if (dato!.isEmpty) {
                          return 'Este campo es obligatorio';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Contraseña",
                        suffixIcon: Icon(Icons.lock_outlined),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      controller: _ConfirmpassController,
                      enableInteractiveSelection: false,
                      obscureText: true,
                      validator: (String? dato) {
                        if (dato!.isEmpty) {
                          return 'Este campo es obligatorio';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Confirmar contraseña",
                        suffixIcon: Icon(Icons.lock_outlined),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      controller: _telefono,
                      validator: (String? dato) {
                        if (dato!.isEmpty) {
                          return 'Este campo es obligatorio';
                        }
                      },
                      keyboardType: TextInputType.phone,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(
                          labelText: "Telefono", suffixIcon: Icon(Icons.phone)),
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      controller: _Email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? dato) {
                        if (dato!.isEmpty) {
                          return 'Este campo es obligatorio';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: 'example@gmail.com',
                        suffixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      child: DropdownButtonFormField<String>(
                        value: dropdownController.text,
                        hint: Text("Sede"),
                        items: sedes.map((String value) {
                          return DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownController.text = newValue!;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 50.0,
                      width: 150.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black87,
                          onPrimary: Colors.white70,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          elevation: 4,
                        ),
                        onPressed: () async {
                          final selectedValue = dropdownController.text;
                          if (_passController.text ==
                              _ConfirmpassController.text) {
                            if (_formKey.currentState!.validate()) {
                              bool respuesta = await UsersUtilidades()
                                  .saveUsers(
                                      _nombreController.text,
                                      _passController.text,
                                      _telefono.text,
                                      _Email.text,
                                      selectedValue);
                              if (respuesta) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content:
                                      Text('Usuario registrado correctamente'),
                                  backgroundColor: Colors.yellow,
                                ));
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Algo salio mal'),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            }
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Las contraseñas con coinciden'),
                              backgroundColor: Colors.red,
                            ));
                          }
                        },
                        child: Text("Registro"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
