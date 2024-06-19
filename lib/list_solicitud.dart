import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListSolicitudView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Solicitudes'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('requests').orderBy('timestamp', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: EdgeInsets.all(16.0),
            children: snapshot.data!.docs.map((doc) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.description, color: Theme.of(context).primaryColor),
                  title: Text(doc['request']),
                  subtitle: Text(doc['timestamp'] != null
                      ? (doc['timestamp'] as Timestamp).toDate().toString()
                      : 'Sin fecha'),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}