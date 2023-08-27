import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(),
        const Expanded(
            child: Column(
          children: [Text('Hello,'), Text('John Brian')],
        )),
        IconButton.outlined(onPressed: () {}, icon: const Icon(Icons.logout))
      ],
    );
  }
}
