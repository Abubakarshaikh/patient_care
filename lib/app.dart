import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:patient_care/theme.dart';
import 'package:patient_care/view/forget_page.dart';
import 'package:patient_care/view/home_page.dart';
import '../../view/login_page.dart';
import 'bloc/auth_bloc/bloc/auth_bloc.dart';
import 'firebase/firebase_auth_provider.dart';
import 'helpers/loading/loading_screen.dart';
import 'view/register_page.dart';
import 'view/verify_email_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      theme: PatientCareTheme.standard(),
      home: BlocProvider<AuthBloc>(
        create: (_) =>
            AuthBloc(FirebaseAuthProvider())..add(const AuthEventInitialize()),
        child: const AppView(),
      ),
      routes: {
        // createOrUpdateNoteRoute: (context) => const CreateUpdateNoteView(),
      },
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(
            context: context,
            text: state.loadingText ?? 'Please wait a moment',
          );
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return HomePage();
        } else if (state is AuthStateNeedsVerification) {
          return const VerifyEmailPage();
        } else if (state is AuthStateLoggedOut) {
          return const LoginPage();
        } else if (state is AuthStateForgotPassword) {
          return const ForgetPasswordPage();
        } else if (state is AuthStateRegistering) {
          return const RegisterPage();
        } else {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
