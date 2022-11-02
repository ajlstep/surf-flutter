import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestPage4 extends StatefulWidget {
  const TestPage4({Key? key}) : super(key: key);
  final double width = 250;

  @override
  State<TestPage4> createState() => _TestPage4State();
}

class _TestPage4State extends State<TestPage4> {
  final ScrollController _contr = ScrollController();
  double _bigColor = 1;
  double _minColor = 0;

  @override
  void initState() {
    // _contr.animateTo(250,
    //     duration: Duration(milliseconds: 850), curve: Curves.bounceIn);
    _contr.addListener(() {
      // print("offset: ${_contr.offset}; ");
      _minColor = get1(_contr.offset / widget.width);
      _bigColor = 1 - get1(_contr.offset / widget.width);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          controller: _contr,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.green,
              stretchTriggerOffset: widget.width,
              // titleSpacing: 100,
              titleTextStyle: TextStyle(color: Colors.red, fontSize: 32),
              pinned: true,
              title: Text("Список интересных мест",
                  style: TextStyle(
                      color: Colors.red.withOpacity(_minColor), fontSize: 16)),
              flexibleSpace: Center(
                child: Text("Список\nинтересных мест",
                    style: TextStyle(
                        color: Colors.red.withOpacity(_bigColor),
                        fontSize: 32)),
              ),
              expandedHeight: 250,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              for (int i = 0; i < 50; i++)
                Container(
                  child: Text(
                    "row $i",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  color: Colors.brown,
                )
            ])),
          ],
        ),
      ),
    );
  }

  double get1(double numb) {
    if (numb > 1.0) {
      return 1.0;
    } else {
      return numb;
    }
  }
}

class TestPage5 extends StatefulWidget {
  const TestPage5({Key? key}) : super(key: key);
  final double width = 250;

  @override
  State<TestPage5> createState() => _TestPage5State();
}

class _TestPage5State extends State<TestPage5> {
  final ScrollController _contr = ScrollController();
  final double _minFontSize = 22;
  final double _maxFontSize = 32;
  double _obst = 0;
  String _enter = "\n";
  double _fontSize = 32;
  late FractionalOffset _offset;

  @override
  void initState() {
    _obst = widget.width / 1.6;
    _offset = FractionalOffset.center;
    // _contr.animateTo(250,
    //     duration: Duration(milliseconds: 850), curve: Curves.bounceIn);
    _contr.addListener(() {
      // print("offset: ${_contr.offset}; ");
      _fontSize = _maxFontSize -
          get1(_contr.offset / widget.width) * (_maxFontSize - _minFontSize);
      if (_contr.offset > _obst) {
        _enter = "";
        _offset = FractionalOffset.bottomCenter;
      } else {
        _enter = "\n";
        _offset = FractionalOffset.center;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          controller: _contr,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.green,
              stretchTriggerOffset: widget.width,
              // titleSpacing: 100,
              // titleTextStyle: TextStyle(color: Colors.red, fontSize: 32),
              pinned: false,
              // title: Text("Список интересных мест",
              //     style: TextStyle(
              //         color: Colors.red.withOpacity(_minColor), fontSize: 16)),
              flexibleSpace: Align(
                alignment: _offset,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text("Список$_enterинтересных мест",
                      style: TextStyle(color: Colors.red, fontSize: _fontSize)),
                ),
              ),
              expandedHeight: 250,
            ),
            SliverAppBar(
              backgroundColor: Colors.black,
              flexibleSpace: Text("2 app bar flexible space",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.blueAccent,
                      backgroundColor: Colors.black)),
              title: Text(
                "2 app bar",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.blueAccent,
                    backgroundColor: Colors.black),
              ),
              pinned: true,
            ),
            SliverAppBar(
              backgroundColor: Colors.green,
              stretchTriggerOffset: widget.width,
              // titleSpacing: 100,
              // titleTextStyle: TextStyle(color: Colors.red, fontSize: 32),
              pinned: false,
              // title: Text("Список интересных мест",
              //     style: TextStyle(
              //         color: Colors.red.withOpacity(_minColor), fontSize: 16)),
              flexibleSpace: Align(
                alignment: _offset,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text("Список$_enterинтересных мест",
                      style: TextStyle(color: Colors.red, fontSize: _fontSize)),
                ),
              ),
              expandedHeight: 250,
            ),
            SliverAppBar(
              backgroundColor: Colors.black,
              flexibleSpace: Text("2 app bar flexible space",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.blueAccent,
                      backgroundColor: Colors.black)),
              title: Text(
                "2 app bar",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.blueAccent,
                    backgroundColor: Colors.black),
              ),
              pinned: true,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              for (int i = 0; i < 50; i++)
                Container(
                  child: Text(
                    "row $i",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  color: Colors.brown,
                )
            ])),
          ],
        ),
      ),
    );
  }

  double get1(double numb) {
    if (numb > 1.0) {
      return 1.0;
    } else {
      return numb;
    }
  }
}
