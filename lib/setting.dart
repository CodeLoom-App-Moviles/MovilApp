
import 'package:code_loom_app/login.dart';
import 'package:flutter/material.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
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
                  backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Usuario_Pedro_Castro.jpg/1200px-Usuario_Pedro_Castro.jpg'), // URL de la foto del usuario
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Nombre del Usuario",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "correo@example.com",
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
                  title: Text("Lo más destacado"),
                  onTap: () {

                  },
                ),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text("Proveedores disponibles"),
                  onTap: () {
                    //
                  },
                ),
                ListTile(
                  leading: Icon(Icons.work),
                  title: Text("Mis servicios"),
                  onTap: () {
                    // Acción al hacer clic en esta opción
                  },
                ),
                ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text("Dejanos tus comentarios"),
                  onTap: () {
                    // Acción al hacer clic en esta opción
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Ajustes"),
                  onTap: () {
                    // Acción al hacer clic en esta opción
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Salir de la sesión"),
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login()));
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