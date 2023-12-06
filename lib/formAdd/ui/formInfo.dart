import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


class formInfo extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final bool state;
  final String phone;

  formInfo({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.state,
    required this.phone,
  });

  void btnWhatsapp() async{
    var contact = phone;
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";
    
    try{
        if(Platform.isIOS){
          await launchUrl(Uri.parse(iosUrl));
        }
        else{
          await launchUrl(Uri.parse(androidUrl));
        }
    } on Exception{
      throw 'WhatsApp is not installed';
    }
  }

  void btnLlamar() async {
    String phoneNumber = phone;

      bool? isPhoneSupported = await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    
    if (!isPhoneSupported!) {
      throw 'Llamadas telefónicas no están soportadas en este dispositivo.';
    }
  } 

  String stadoImagen() {
  return imageUrl.isNotEmpty ? imageUrl : 'https://cpolite.educacion.navarra.es/web1/wp-content/uploads/2021/09/OBJETOS-PERDIDOS.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
              stadoImagen(),
              width: 300, 
              height: 200, 
              fit: BoxFit.cover,
            ),
            ),
            const SizedBox(height: 8),
            Text(
              'Descripción: $description',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Celular: $phone',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Estado: ${state ? "Activo" : "Inactivo"}',
              style: TextStyle(
                color: state ? Colors.green : Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: btnWhatsapp,
              child: const Text('WhatsApp'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: btnLlamar,
              child: const Text('Llamar'),
            ),
          ],
        ),
      ),
    );
  }
}
