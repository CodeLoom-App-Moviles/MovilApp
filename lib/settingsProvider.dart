import 'package:code_loom_app/AddSoftware.dart';
import 'package:code_loom_app/softwares.dart';
import 'package:code_loom_app/list_solicitud.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class settingsProvider extends StatelessWidget {
  final User user;

  settingsProvider({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menú"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.grey[200],
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqVg_URh9Mvrm3NYaTlCUyiM7r382ohELc1g&s'),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      user.displayName ?? user.email!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      user.email!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text("Tus solicitudes"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListSolicitudView(userId: user.uid)),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.work),
                  title: Text("Añadir Servicio"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddSoftwarePage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.list),
                  title: Text("Mis Servicios"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProviderServicesPage(user: user)),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text("Dejanos tus comentarios"),
                  onTap: () {
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => qualify()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Salir de la sesión"),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                          (Route<dynamic> route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
