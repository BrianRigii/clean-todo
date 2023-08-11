import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0).copyWith(top: 16),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.person_3_outlined),
              Column(
                children: [
                  Text('Hello,'),
                  Text('Mobile Team'),
                ],
              ),
              Spacer(),
              IconButton.outlined(
                  onPressed: () {}, icon: Icon(EvaIcons.calendarOutline)),
              IconButton.outlined(
                  onPressed: () {}, icon: Icon(EvaIcons.bellOutline)),
            ],
          )
        ],
      ),
    ));
  }
}
