import 'package:clean_todo/features/dashboard/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const path = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              HomeAppBar(),
            ],
          ),
        ),
      ),
    );
  }
}
