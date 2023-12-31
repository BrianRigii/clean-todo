import 'package:clean_todo/features/dashboard/presentation/widgets/home_app_bar.dart';
import 'package:clean_todo/features/dashboard/presentation/widgets/home_content.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const path = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0).copyWith(top: 32),
          child: const Column(
            children: [
              HomeAppBar(),
              Expanded(
                child: HomeContent(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
