import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class services extends StatelessWidget {
  final User user;

  services({required this.user});

  Future<DocumentSnapshot> _getSoftwareData(String softwareId) {
    return FirebaseFirestore.instance.collection('software').doc(softwareId).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Servicios Contratados'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('requests')
            .where('userId', isEqualTo: user.uid)
            .where('status', isEqualTo: 'delivered')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: EdgeInsets.all(16.0),
            children: snapshot.data!.docs.map((doc) {
              var softwareId = doc['softwareId'];
              return FutureBuilder<DocumentSnapshot>(
                future: _getSoftwareData(softwareId),
                builder: (context, softwareSnapshot) {
                  if (softwareSnapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (softwareSnapshot.hasError) {
                    return Center(child: Text('Ocurrió un error: ${softwareSnapshot.error}'));
                  }

                  if (!softwareSnapshot.hasData || !softwareSnapshot.data!.exists) {
                    return Center(child: Text('No se encontró el software.'));
                  }

                  var software = softwareSnapshot.data!.data() as Map<String, dynamic>;

                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Image.network(
                        software['logoUrl'],
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(software['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Rubro: ${software['category']}'),
                          Text('Descripción: ${software['description']}'),
                          Text('Precio: S/ ${software['price']}'),
                          Text('Fecha de solicitud: ${doc['timestamp'] != null
                              ? (doc['timestamp'] as Timestamp).toDate().toString()
                              : 'Sin fecha'}'),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
