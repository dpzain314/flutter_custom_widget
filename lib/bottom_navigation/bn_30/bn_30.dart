import 'package:custom_widget/bottom_navigation/bn_30/bn_30_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Bn30 extends StatefulWidget {
  const Bn30({super.key});

  @override
  State<Bn30> createState() => _Bn30State();
}

class _Bn30State extends State<Bn30> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: Bn30Painter(),
      child: SafeArea(
        child: Container(
          height: 60,
          alignment: Alignment.bottomCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Expanded(child: Icon(Icons.access_time_filled,size: 30)),
              Expanded(child: Icon(Icons.access_time_filled,size: 30)),
              Expanded(child: Icon(Icons.access_time_filled, size: 60)),
              Expanded(child: Icon(Icons.access_time_filled,size: 30)),
              Expanded(child: Icon(Icons.access_time_filled,size: 30)),
            ],
          ),
        ),
      ),
    );
  }
}
