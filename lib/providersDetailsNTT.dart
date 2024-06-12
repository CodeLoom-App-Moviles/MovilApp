import 'package:flutter/material.dart';

class providersDetailsNTT extends StatefulWidget {
  const providersDetailsNTT({super.key});

  @override
  State<providersDetailsNTT> createState() => _providersDetailsState();
}

class _providersDetailsState extends State<providersDetailsNTT>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('NTT Data',textAlign: TextAlign.center,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/img/nttdata.gif'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img/providerntt.png',width: 300,height: 100,)
            ],
          ),
          Text('Somos una empresa dedicada a brindar soluciones de software eficiente.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18)),
          Table(
            columnWidths: const<int, TableColumnWidth>{
              1: FlexColumnWidth(),
              2: FixedColumnWidth(64),
            },
            children: <TableRow>[
              TableRow(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 64,
                    child: Text('Aplicacion Web'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 64,
                    child: Text('Creamos tu aplicacion web responsive')
                  )
                ]
              ),
              TableRow(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      height: 64,
                      child: Text('Servicio Cloud'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 64,
                      child: Text('Te brindamos un servicio de nube para tu empresa')
                    )
                  ]
              ),
            ],
          ),
          Material(
            child: Center(
              child: Ink(
                decoration: const ShapeDecoration(shape: CircleBorder(),color: Colors.green),
                child: IconButton(
                  icon: const Icon(Icons.add_call),
                  color: Colors.white,
                  onPressed: (){},
                ),
              ),
            ),
          ),
          Text('Contactar a la empresa')
        ],
      ),
    );
  }
}