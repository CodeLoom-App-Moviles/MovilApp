import 'package:flutter/material.dart';

class services extends StatefulWidget {
  const services({super.key});

  @override
  State<services> createState() => _servicesState();
}

class _servicesState extends State<services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            color: Colors.deepPurpleAccent,
            onPressed: () {

            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Mis servicios', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            ),
            SizedBox(
              height: 10,
            ),
            SearchAnchor.bar(
                barHintText: 'Search services',
                viewBackgroundColor: Color(0x993949AB),
                suggestionsBuilder: (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
                        });
                      },
                    );
                  });
                }),
            Card(
              child:Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ListTile(
                    title: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('NTT Data', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurpleAccent,
                      ),),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://apn-portal.file.force.com/servlet/servlet.ImageServer?id=0158W000008e3WgQAI&oid=00DE0000000c48tMAA'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text('4.5'),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('COTIZAR'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child:Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ListTile(
                    title: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Globant', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurpleAccent,
                      ),),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Globant_Logo.svg/2560px-Globant_Logo.svg.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text('4.5'),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('COTIZAR'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}