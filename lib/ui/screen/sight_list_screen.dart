import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('appbar'),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: [
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
          createCard(name: 'ic1', subname: 'sub ic1', ic: Icons.add),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.abc),
      ),
    );
  }
}

Widget createCard({required String name, subname, required IconData ic}) {
  var cd = Card(
    child: Container(
      // height: 100,
      color: Colors.white,
      child: Container(
        color: Colors.red,
        child: Row(
          children: [
            Center(
              child: Expanded(
                child: Icon(ic),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                child: Container(
                  color: Colors.blueGrey,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: ListTile(
                          title: Text(name),
                          subtitle: Text(subname),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          color: Colors.yellow,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('ok'),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromARGB(
                                            255, 236, 168, 128))),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('cancel'),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(255, 155, 228, 153)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
  return cd;
}
