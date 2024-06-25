import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class qualify extends StatelessWidget {
  const qualify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Qualifications'),
    ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/logo.png',

              height: 200,
              width: 200,
            ),
          // Logo
          SizedBox(height: 18),
          // Text below the logo
              Text(
            'Te invitamos a calificar tu experiencia con nosotros. '
                'Tu opinión es muy importante y nos ayuda a mejorar continuamente nuestros servicios. Por favor, tómate unos momentos para compartir tu valoración y comentarios.',
              style: TextStyle(fontSize: 18,
              color: Colors.blueGrey[700],
              fontWeight: FontWeight.w600,),
              textAlign: TextAlign.center,

            ),
            SizedBox(height: 24),
            // Button with icon and text
            ElevatedButton.icon(
              icon: Icon(Icons.facebook, color: Colors.blue, size: 40),
              label: Text(
                'Calificar ahora',
                style: TextStyle(fontSize: 18,
                  color: Colors.blueGrey[700],),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24),
              ), onPressed: () {  },
              //onPressed: () => _launchURL('https://www.facebook.com/'),
            ),

          ],
        ),
      )
    )
      ;
  }
}

/*void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}*/
