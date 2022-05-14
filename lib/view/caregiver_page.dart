import 'package:flutter/material.dart';
import 'package:patient_care/colors.dart';

class CaregiverPage extends StatelessWidget {
  static Route<CaregiverPage> route() {
    return MaterialPageRoute(builder: (_) => const CaregiverPage());
  }

  const CaregiverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PatientCareColors.indigo,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("I'm Caregiver",
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                _InputQuantity(),
                const SizedBox(height: 18),
                _NextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InputQuantity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(labelText: 'quantity'),
    );
  }
}

class _NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Next"),
      onPressed: () {},
    );
  }
}
