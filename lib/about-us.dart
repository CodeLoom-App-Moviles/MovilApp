import 'package:flutter/material.dart';

class aboutUs extends StatelessWidget {
  const aboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre Nosotros"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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

              SizedBox(height: 16),

              Text(
                'Presentamos la aplicación "CodeLoom", una app con la idea de tejer soluciones tecnológicas a medida,'
                    ' al igual que un telar teje hilos para crear un tejido único. CodeLoom representa nuestra ambición'
                    ' de entrelazar la innovación, la tecnología y la personalización en el mercado de software,'
                    ' ofreciendo una plataforma donde cada cliente pueda encontrar soluciones que se ajustan perfectamente'
                    ' a las necesidades y expectativas de nuestros usuarios.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Nuestro Equipo',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Respaldados por ThreadTechs, nuestro equipo está compuesto por estudiantes apasionados y'
                    ' experimentados en el diseño y la programación con un enfoque renovado en las tecnologías móviles.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Nuestro Contexto',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'En un mundo impulsado por rápidos cambios sociopolíticos que han acelerado la digitalización '
                    'y aumentado la demanda de soluciones basadas en software eficiente, CodeLoom surge como una '
                    'respuesta innovadora a esta creciente necesidad. Entendemos que tanto individuos como empresas '
                    'buscan cualquier tipo de software de calidad que no solo cumpla con sus requisitos funcionales, '
                    'sino que también ofrezca una experiencia de usuario fluida y agradable.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Nuestras Soluciones',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm9XkJy2FlPpd7663mUvTt_X2O5giR0_f6hQ&s",
                  height: 150,
                ),
              ),

              SizedBox(height: 8),
              Text(
                'Para abordar estos desafíos, CodeLoom se especializa en el contacto con proveedores '
                    'y clientes de todo tipo para el mercado del software. Utilizando Kotlin y Dart como '
                    'lenguajes de programación y Figma para el diseño de interfaces, garantizaremos la '
                    'funcionalidad y la experiencia de usuario en nuestra plataforma de concertación o '
                    'tercerización de software, poniendo énfasis en que cada aspecto de la experiencia '
                    'del usuario sea intuitivo, atractivo y acorde a las últimas tendencias en diseño UI/UX.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Misión',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Nuestra misión es revolucionar el acceso al software de alta calidad en Perú, haciendo '
                'que sea accesible y personalizado para cada usuario. En CodeLoom, trabajamos '
                'incansablemente para superar las barreras que existen entre los usuarios y '
                'los desarrolladores de software, facilitando una conexión directa y efectiva a '
                'través de nuestra plataforma de desarrollo móvil.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Visión',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Nuestra visión es posicionarnos como el núcleo de innovación como desarrolladores'
                    ' de aplicaciones móviles en Perú, fomentando la digitalización y el avance tecnológico'
                    ' en el país. Aspiramos a que cada usuario se sienta completamente integrado y satisfecho'
                    ' con las soluciones que CodeLoom ofrece, experimentando el máximo potencial de las tecnologías'
                    ' emergentes."',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
