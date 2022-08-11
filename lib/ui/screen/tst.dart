import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestPAge extends StatelessWidget {
  const TestPAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: const TestBody(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<int> _items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: <Widget>[
        for (int index = 0; index < _items.length; index += 1)
          ListTile(
            key: Key('$index'),
            tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
            title: Text('Item ${_items[index]}'),
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final int item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
    );
  }
}

class TestBody extends StatefulWidget {
  const TestBody({Key? key}) : super(key: key);

  @override
  State<TestBody> createState() => _TestBodyState();
}

class _TestBodyState extends State<TestBody> {
  final List<int> _items = List<int>.generate(50, (int index) => index);
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: TestStack(
    //     x: 10,
    //     y: 10,
    //     color: Colors.blue,
    //   ),
    // );
    return Center(
      child: ReorderableListView(
        children: [
          for (int i = 0; i < _items.length; i++)
            // Container(
            //   padding: const EdgeInsets.all(15.0),
            //   key: Key("value ${_items[i]}"),
            //   height: 25,
            //   color: Colors.red,
            //   width: 25,
            // ),
            SizedBox(
              width: 25,
              height: 25,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child:
                    DecoratedBox(decoration: BoxDecoration(color: Colors.blue)),
              ),
              key: Key("value ${_items[i]}"),
            ),
        ],
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}

class TestStack extends StatefulWidget {
  const TestStack({
    Key? key,
    required this.x,
    required this.y,
    required this.color,
  }) : super(key: key);
  final double x;
  final double y;
  final Color color;
  @override
  State<TestStack> createState() => _TestStackState();
}

class _TestStackState extends State<TestStack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 25,
              height: 25,
              color: widget.color.withOpacity(0.24),
            ),
            top: widget.x,
            left: widget.y,
          ),
          Positioned(
            child: Container(
              width: 25,
              height: 25,
              color: widget.color,
            ),
            top: widget.x + 10,
            left: widget.y + 10,
          ),
        ],
      ),
    );
  }
}
