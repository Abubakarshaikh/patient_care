import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_care/colors.dart';

class StartupPage extends StatelessWidget {
  static Route<StartupPage> route() {
    return CupertinoPageRoute(builder: (_) => const StartupPage());
  }

  const StartupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PatientCareColors.indigo,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("login"),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
