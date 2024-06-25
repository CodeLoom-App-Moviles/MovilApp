import 'package:code_loom_app/about-us.dart';
import 'package:code_loom_app/settingsProvider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class dashboardProvider extends StatelessWidget {
  final User user;

  dashboardProvider({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  'Bienvenido, ${user.displayName ?? user.email}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => aboutUs()));
                },
                child: Card(
                  color: Color(0xD7ADF4FF),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Center(
                        child: Image.asset(
                          'assets/img/logo.png',
                          height: 140,
                          width: 140,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "Quienes Somos",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "Somos una app con la idea de tejer soluciones tecnológicas a "
                              "medida, al igual que un telar teje hilos para crear un tejido único. CodeLoom representa nuestra "
                              "ambición de entrelazar la innovación, la tecnología y la personalización en el mercado de "
                              "software. ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                color: Color(0xD7ADF4FF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Center(
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm9XkJy2FlPpd7663mUvTt_X2O5giR0_f6hQ&s",
                        height: 210,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "Funciones",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "La función principal es actuar como un puente entre proveedores de software y potenciales "
                            "usuarios. A través de nuestra aplicación movil, pretendemos simplificar y desmitificar el proceso de "
                            "selección y adquisición de software, haciéndolo más accesible y eficiente para todos los "
                            "involucrados.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.menu),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return settingsProvider(user: user); // Pasamos el usuario autenticado
          }));
        },
      ),
    );
  }
}
