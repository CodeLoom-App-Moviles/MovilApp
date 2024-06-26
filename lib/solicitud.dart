import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SolicitudView extends StatefulWidget {
  final String softwareId;

  SolicitudView({required this.softwareId});

  @override
  _SolicitudViewState createState() => _SolicitudViewState();
}

class _SolicitudViewState extends State<SolicitudView> {
  final _formKey = GlobalKey<FormState>();
  final _requestController = TextEditingController();
  bool _isSending = false;

  Future<void> _sendRequest() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      User? currentUser = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance.collection('requests').add({
        'request': _requestController.text,
        'timestamp': FieldValue.serverTimestamp(),
        'userId': currentUser!.uid,
        'status' : 'pending',
        'softwareId': widget.softwareId,
      });

      setState(() {
        _isSending = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Solicitud enviada')),
      );

      _requestController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enviar Solicitud'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Descripción de la Solicitud',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _requestController,
                decoration: InputDecoration(
                  labelText: 'Ingrese su solicitud',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la descripción de la solicitud';
                  }
                  return null;
                },
                maxLines: 3,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: _isSending ? null : _sendRequest,
                  icon: Icon(Icons.send),
                  label: Text('Enviar Solicitud'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              if (_isSending)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
