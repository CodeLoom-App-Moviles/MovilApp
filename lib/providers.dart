import 'package:code_loom_app/providersDetailsNTT.dart';
import 'package:code_loom_app/qualify.dart';
import 'package:flutter/material.dart';

class providers extends StatefulWidget {

  @override
  State<providers> createState() => _providersState();
}

class _providersState extends State<providers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text('Proveedores disponibles',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),)
          ,
            Card.outlined(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Image.asset('assets/img/providerntt.png',
                  scale: 0.5,),
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('NTT DATA PERU'),
                    subtitle: Text('Consultora multinacional de negocios y tecnología'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(onPressed: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> providersDetailsNTT()));
                      }, child: const Text('CONSULTAR')),
                      const SizedBox( width: 8),
                    ],
                  )
                ],
              )
              ,
            ),
            Card.outlined(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Image.asset('assets/img/globant_logo.png',
                    scale: 0.5,),
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('GLOBANT'),
                    subtitle: Text('Como empresa nativa digital, nos apasiona la forma en que la tecnología puede cambiar industrias, experiencias y vidas.'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(onPressed: (){}, child: const Text('CONSULTAR')),
                      const SizedBox( width: 8),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.menu),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return qualify();
          }));
        },
      ),
    );
  }
}
