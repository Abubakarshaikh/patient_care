import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_care/extension/buildcontext/loc.dart';
import '../../exceptions/auth_exceptions.dart';
import '../bloc/auth_bloc/bloc/auth_bloc.dart';
import '../utilities/dialogs/error_dialog.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateRegistering) {
          if (state.exception is WeakPasswordAuthException) {
            await showErrorDialog(
              context,
              context.loc.register_error_weak_password,
            );
          } else if (state.exception is EmailAlreadyInUseAuthException) {
            await showErrorDialog(
              context,
              context.loc.register_error_email_already_in_use,
            );
          } else if (state.exception is GenericAuthException) {
            await showErrorDialog(
              context,
              context.loc.register_error_generic,
            );
          } else if (state.exception is InvalidEmailAuthException) {
            await showErrorDialog(
              context,
              context.loc.register_error_invalid_email,
            );
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Register"),
        ),
        body: Align(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text("Enter your email and password"),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: 'email'),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(labelText: 'password'),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      context.read<AuthBloc>().add(
                            AuthEventRegister(
                              email,
                              password,
                            ),
                          );
                    },
                    child: Text(
                      context.loc.register,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            const AuthEventLogOut(),
                          );
                    },
                    child: Text(
                      context.loc.register_view_already_registered,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
