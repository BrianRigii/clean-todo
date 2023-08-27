import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          child: Image.asset(
            'assets/images/avatar.png',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Hello,'), Text('John Brian')],
        )),
        IconButton.outlined(
            onPressed: () {}, icon: const Icon(EvaIcons.calendarOutline)),
        IconButton.outlined(
            onPressed: () {}, icon: const Icon(EvaIcons.bellOutline))
      ],
    );
  }
}
