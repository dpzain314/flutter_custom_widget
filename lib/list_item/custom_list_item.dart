import 'dart:math';

import 'package:flutter/material.dart';

import 'custom_list_item_painter.dart';

class CustomListItem extends StatefulWidget {
  const CustomListItem({super.key});

  @override
  State<CustomListItem> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  final data = [
    'asdfjkahsdjkhfkhakshdlfkhaksjhdfjkhaskjdhfkjhsklhafl',
    'asdfjkahsdjkhfkhakshdlfkhaksjhdfjkhaskjdhfkjhsklhaflkjshdlkfjhaskldhfklahsjkldhflkshdklfhasdfjkahsdjkhfkhakshdlfkhaksjhdfjkhaskjdhfkjhsklhaflkjshdlkfjhaskldhfklahsjkldhflkshdklfhasdfjkahsdjkhfkhakshdlfkhaksjhdfjkhaskjdhfkjhsklhaflkjshdlkfjhaskldhfklahsjkldhflkshdklfhasdfjkahsdjkhfkhakshdlfkhaksjhdfjkhaskjdhfkjhsklhaflkjshdlkfjhaskldhfklahsjkldhflkshdklfhasdfjkahsdjkhfkhakshdlfkhaksjhdfjkhaskjdhfkjhsklhaflkjshdlkfjhaskldhfklahsjkldhflkshdklfhasdfjkahsdjkhfkhakshdlfkhaksjhdfjkhaskjdhfkjhsklhaflkjshdlkfjhaskldhfklahsjkldhflkshdklfhasdfjkahsdjkhfkhakshdlfkhaksjhdfjkhaskjdhfkjhsklhaflkjshdlkfjhaskldhfklahsjkldhflkshdklfhasdfjkahsdjkhfkhakshdlfkhaksjhdfjkhaskjdhfkjhsklhaflkjshdlkfjhaskldhfklahsjkldhflkshdklfhasdfjkahsdjkhfkhakshdlfkhaksjhdfjkhaskjdhfkjhsklhaflkjshdlkfjhaskldhfklah',
    'asdfjkahsdjkhfkhakshdlfkhaksjhdfjkhaskjdhfkjhsklhaflkjshdlkfjhaskldhfklahsjkldhflkshdklfhskdfklshdkfjhasdfjkahsdjkhfkhakshdlfkhaksjhdfjkhaskjdhfkjhsklhaflkjshdlkfjhaskldhfklahsjkldhflkshdklfhskdfklshdkfjhasdfjkahsdjkhfkhakshdlfkhaksjhdfjkhaskjdhfkjhsklhaflkjshdlkfjhaskldhfklahsjkldhflkshdklfhskdfklshdkfjh'
  ];

  @override
  Widget build(BuildContext context) {
    final listWidget = data
        .map((e) => CustomPaint(
              painter: CustomListItemPainter(e==data.first, e == data.last),
              child: Container(
                margin: const EdgeInsets.only(left: 50, top: 4),
                width: double.infinity,
                // child: Column(
                //   children: listWidget,
                // )
                child: ItemSample(
                  data: e,
                ),
              ),
            ))
        .toList();
    return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 18),
        color: Colors.white,
        // width: double.infinity,
        child: Column(
          children: listWidget,
        ));
  }
}

class ItemSample extends StatelessWidget {
  const ItemSample({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Expanded(child: Text('P.101', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
              Text('500,000',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))
            ],
          ),
          const SizedBox(height: 4),
          const Text('3 x Ngày', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF525D6A))),
          Text('1 x $data - Chai',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF525D6A))),
          const Text('2 x Mỳ tôm',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF525D6A))),
        ],
      ),
    );
  }
}
