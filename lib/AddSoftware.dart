import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddSoftwarePage extends StatefulWidget {
  @override
  _AddSoftwarePageState createState() => _AddSoftwarePageState();
}

class _AddSoftwarePageState extends State<AddSoftwarePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _category = '';
  String _logoUrl = '';
  String _description = '';
  String _price = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Software'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre de la Empresa'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese el nombre';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Rubro'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese el rubro';
                  }
                  return null;
                },
                onSaved: (value) {
                  _category = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL del Logo'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese la URL del logo';
                  }
                  return null;
                },
                onSaved: (value) {
                  _logoUrl = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descripción'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese una descripción';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
                maxLines: 5,  // Permite escribir más de una línea de texto
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Precio'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese el precio';
                  }
                  return null;
                },
                onSaved: (value) {
                  _price = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      FirebaseFirestore.instance.collection('software').add({
        'name': _name,
        'category': _category,
        'logoUrl': _logoUrl,
        'description': _description,
        'price': _price,
        'userId': FirebaseAuth.instance.currentUser!.uid,
      }).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Software agregado')));
        Navigator.pop(context);
      });
    }
  }
}
