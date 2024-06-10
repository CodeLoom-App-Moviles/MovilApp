import 'package:code_loom_app/register.dart';
import 'package:code_loom_app/registerProveedor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_loom_app/setting.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> with SingleTickerProviderStateMixin {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  late TabController _tabController;

  validarCliente() async{
    try{
      CollectionReference ref= FirebaseFirestore.instance.collection('Clients');
      QuerySnapshot cliente = await ref.get();

      if(cliente.docs.length != 0){
        for(var cursor in cliente.docs){
          if(cursor.get('Email') == email.text && cursor.get('Password') == password.text){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => setting()));
            print("Cliente Encontrado");
          }else{
            print("No se encontrooo....");
          }

        }

      }else{
        print("Cliente no encontrado");
      }


    }catch(e){
      print(e.toString());
    }

  }

  validarProveedor() async{
    try{
      CollectionReference ref= FirebaseFirestore.instance.collection('Suppliers');
      QuerySnapshot proveedor = await ref.get();

      if(proveedor.docs.length != 0){
        for(var cursor in proveedor.docs){
          if(cursor.get('Email') == email.text && cursor.get('Password') == password.text){
            //Navigator.push(context, MaterialPageRoute(builder: (context) => dashboardProveedor()));
            print("Proveedor Encontrado");
          }else{
            print("No se encontrooo....");
          }
        }

      }else{
        print("Proveedor no encontrado");
      }
    }catch(e){
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _navigateToRegister() {
    if (_tabController.index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => register()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => registerProveedor()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Cliente'),
            Tab(text: 'Proveedor'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildLoginTab(context, 'Cliente'),
          _buildLoginTab(context, 'Proveedor'),
        ],
      ),
    );
  }

  Widget _buildLoginTab(BuildContext context, String userType) {
    return Column(
      children: [
        Image.asset(
          'assets/img/logo.png',
          height: 120,
          width: 120,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Inicia Sesión como $userType',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Contraseña',
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if(userType=="Cliente"){
                      validarCliente();
                    }else{
                      validarProveedor();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0x993949AB),
                  ),
                  child: Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¿Estás Registrado? ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            GestureDetector(
              onTap: _navigateToRegister,
              child: Text(
                'Registrate ahora',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0x993949AB),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}