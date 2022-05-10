import 'package:flutter/material.dart';

class StartupPage extends StatelessWidget {
  static Route<StartupPage> route() {
    return MaterialPageRoute(builder: (_) => const StartupPage());
  }

  const StartupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("Patient"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Caregiver"),
          ),
        ],
      ),
    );
  }
}
