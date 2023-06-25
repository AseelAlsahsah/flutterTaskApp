import 'package:flutter/material.dart';

List<String> columnList = [
  'Alarm 1',
  'Alarm 2',
  'Alarm 3',

  // Add more items as needed
];


class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);

  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Welcome to Aumet",
            style: TextStyle(fontSize: 20),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Button'),
          )
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: true,
        title: const Text("Task"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_card),
            tooltip: 'Add Card',
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          child: const Text(
            "Let's try Flutter",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100.0,
                    child: ListView.builder(
                      itemCount: columnList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: const Icon(Icons.access_alarm),
                          title: Text(columnList[index], style: const TextStyle(
                            fontSize: 14.0,
                          )),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Image.network(
                          "https://www.tutorialkart.com/img/lion.jpg",
                          fit: BoxFit.fill,
                          width: 130,
                          height: 80,
                        ),
                      ),
                      Container(
                        // margin: const EdgeInsets.only(bottom: 5),
                        child: const Text("Caption goes here"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(context: context, builder: (context)=>AlertDialog(
                            title: const Text("Time Based on Your Location", textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
                            content: Container(
                              height: 90,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data['location'],
                                          style: const TextStyle(
                                            fontSize: 28.0,
                                            letterSpacing: 2.0,
                                          )),
                                    ],
                                  ),
                                  Text(
                                    data['time'],
                                    style: const TextStyle(
                                      fontSize: 46.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("Yes"))
                            ],
                          ));
                        },
                        child: const Text('Open Dialog'),
                      )
                    ],
                  ),
                ),
              ],
            )),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                "https://static.vecteezy.com/system/resources/previews/008/552/477/original/abstract-banner-background-with-lines-pattern-illustration-free-vector.jpg",
                // fit: BoxFit.fill,
                width: 300,
                height: 150,
              ),
              const Text(
                "Banner",
                style: TextStyle(fontSize: 50),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            onPressed: () {
              _showBottomSheet(context);
            },
            child: const Text("Open Bottom Sheet"),
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Courses",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: "Mail",
          ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        // onTap: _onItemTapped,
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => ModalBottomSheet(),
    );
  }
}
