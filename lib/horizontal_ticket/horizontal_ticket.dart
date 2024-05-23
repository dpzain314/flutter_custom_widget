import 'package:flutter/material.dart';

import 'horizontal_ticket_painter.dart';

class HorizontalTicket extends StatefulWidget {
  const HorizontalTicket({super.key, required this.width, required this.height});

  final double width;
  final double height;
 
  @override
  State<HorizontalTicket> createState() => _HorizontalTicketState();
}

class _HorizontalTicketState extends State<HorizontalTicket> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      // size: Size(200, 200),
      painter: HorizontalTicketPainter(),
      child: Container(
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Container(
              margin: const EdgeInsets.only(left: 15),
                width: 40,
                height: 40,
                color: Colors.green,
             ),
          ],
        ),
      ),
    );
  }
}
