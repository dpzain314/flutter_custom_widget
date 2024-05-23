import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SwipeStack(),
      ),
    );
  }
}

class SwipeStack extends StatefulWidget {
  const SwipeStack({super.key});

  @override
  SwipeStackState createState() => SwipeStackState();
}

class SwipeStackState extends State<SwipeStack> {
  List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];
  double dragOffset = 0.0;

  _backGroundWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg'),
              fit: BoxFit.cover,
              opacity: 0.3)),
    );
  }

  _header() {
    return Row(
      children: [
        const Text('Nearby', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400)),
        const SizedBox(width: 20),
        const Text('Following', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400)),
        const Spacer(),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: const Center(child: Icon(Icons.add, size: 30)),
        ),
      ],
    );
  }

  _actionButton() {
    return Wrap(
      spacing: 15,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: const Center(child: Icon(Icons.abc_rounded, size: 30)),
        ),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: const Center(child: Icon(Icons.abc_rounded, size: 30)),
        ),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: const Center(child: Icon(Icons.abc_rounded, size: 30)),
        ),
      ],
    );
  }

  _newFeed() {
    // return Draggable(
    //   feedback: Container(
    //     height: 400,
    //     width: 400,
    //     margin: const EdgeInsets.symmetric(vertical: 20),
    //     decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35)),
    //     alignment: Alignment.center,
    //   ),
    //   childWhenDragging: const SizedBox(),
    //   child: Container(
    //     height: 400,
    //     margin: const EdgeInsets.symmetric(vertical: 20),
    //     decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35)),
    //     alignment: Alignment.center,
    //     // child: const Text(
    //     //   'item',
    //     //   style: TextStyle(color: Colors.white, fontSize: 24),
    //     // ),
    //   ),
    // );
    return Dismissible(
      key: Key('key'),
      direction: DismissDirection.vertical,
      child: Container(
        height: 400,
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35)),
        alignment: Alignment.center,
        child: const Text(
          'item',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Stack(
    //   children: items.map((item) {
    //     int index = items.indexOf(item);
    //     return Positioned(
    //       top: index == items.length - 1 ? dragOffset : 0,
    //       left: 0,
    //       right: 0,
    //       child: GestureDetector(
    //         onPanUpdate: (details) {
    //           setState(() {
    //             dragOffset += details.delta.dy;
    //           });
    //         },
    //         onPanEnd: (details) {
    //           if (dragOffset > 100) {
    //             setState(() {
    //               items.removeLast();
    //               items.insert(0, 'item${Random().nextInt(100)}');
    //               dragOffset = 0.0;
    //             });
    //           } else {
    //             setState(() {
    //               dragOffset = 0.0;
    //             });
    //           }
    //         },
    //         child: Card(
    //           margin: EdgeInsets.all(20),
    //           color: Colors.blue[(index + 1) * 100],
    //           child: Container(
    //             height: 300,
    //             alignment: Alignment.center,
    //             child: Text(
    //               item,
    //               style: TextStyle(color: Colors.white, fontSize: 24),
    //             ),
    //           ),
    //         ),
    //       ),
    //     );
    //   }).toList(),
    // );
    return Stack(
      children: [
        Positioned.fill(child: _backGroundWidget()),
        Positioned(top: 0, left: 16, right: 16, child: SafeArea(child: _header())),
        Positioned(bottom: 0, left: 16, child: SafeArea(child: _actionButton())),
        Positioned(bottom: 60, left: 16, right: 16, child: SafeArea(child: _newFeed()))
      ],
    );
  }
}
