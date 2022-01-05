import 'package:flutter/material.dart';

import 'data.dart';

class ReactDialog extends StatelessWidget {
  final double dx, dy;

  const ReactDialog({Key? key, required this.dx, required this.dy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _reactEmojis = reactEmojis.split(' ');
    const _fromTop = 80;
    double _width = MediaQuery.of(context).size.width;
    double _left = dx < 180
        ? dx / 3
        : _width - 100 > dx
            ? dx - 120
            : dx - 10 < _width
                ? dx - 180
                : 0;
    return Container(
        margin: EdgeInsets.only(
            top: dy > 100 ? dy - _fromTop : dy + 0, left: _left),
        alignment: Alignment.topLeft,
        child: SizedBox(
            height: 40,
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              ..._reactEmojis
                  .map((e) => Material(
                      color: Colors.transparent,
                      child: Text(e, style: const TextStyle(fontSize: 25))))
                  .toList()
            ])));
  }
}
