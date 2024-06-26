import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListSolicitudView extends StatelessWidget {
  final String softwareId;

  ListSolicitudView({required this.softwareId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Solicitudes'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('requests')
            .where('softwareId', isEqualTo: softwareId)
            .where('status', isEqualTo: 'pending')
            .orderBy('timestamp', descending: true)
            .snapshots(),
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
                  trailing: ElevatedButton(
                    onPressed: () async {
                      try {
                        await FirebaseFirestore.instance
                            .collection('requests')
                            .doc(doc.id)
                            .update({'status': 'delivered'});
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Servicio entregado')),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error al actualizar la solicitud: $e')),
                        );
                      }
                    },
                    child: Text('Entregar'),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
