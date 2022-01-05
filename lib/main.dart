import 'package:custom_position_popup/data.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import 'components.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? _dx, _dy;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title:
                const Text('Countries', style: TextStyle(color: Colors.black))),
        body: ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: GestureDetector(
                  ///
                  onTapDown: (details) {
                    _dx = details.globalPosition.dx;
                    _dy = details.globalPosition.dy;
                  },

                  ///
                  onLongPress: () {
                    showModal(
                        context: context,
                        configuration: const FadeScaleTransitionConfiguration(
                            barrierColor: Colors.transparent),
                        builder: (context) => ReactDialog(dx: _dx!, dy: _dy!));
                  },

                  ///
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.white,
                      elevation: 5,
                      shadowColor: Colors.black,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(countries[index],
                              style: const TextStyle(fontSize: 25)))),
                ))));
  }
}
