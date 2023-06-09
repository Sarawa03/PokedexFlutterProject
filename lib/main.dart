import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproject/constants/colors.dart';
import 'package:flutterproject/constants/theme_color.dart';
import 'package:flutterproject/services/api/api_repository.dart';
import 'package:flutterproject/services/api/bloc/api_bloc.dart';
import 'package:flutterproject/services/auth/bloc/auth_bloc.dart';
import 'package:flutterproject/services/auth/bloc/auth_event.dart';
import 'package:flutterproject/services/auth/bloc/auth_state.dart';
import 'package:flutterproject/services/auth/firebase_auth_provider.dart';
import 'package:flutterproject/ui/views/login_view.dart';
import 'package:flutterproject/ui/views/register_view.dart';
import 'package:flutterproject/ui/views/main_view.dart';
import 'package:flutterproject/ui/views/verify_email_view.dart';
import 'helpers/loading/loading_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: ColorTheme.myTheme,
          scaffoldBackgroundColor: tbackgroundColor,
        ),
        home: MultiBlocProvider(providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(FirebaseAuthProvider()),
          ),
          BlocProvider<ApiBloc>(
            create: (context) => ApiBloc(Repository()),
          )
        ], child: const HomePage())),
    /*routes: {
      //creteOrUpdateNoteRoute: (context) => const CreateUpdateNoteView(),
    },*/
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
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
          return const MainView();
        } else if (state is AuthStateLoggedOut) {
          return const LoginView();
        } else if (state is AuthStateNeedsVerification) {
          return const VerifyEmailView();
        } else if (state is AuthStateRegistering) {
          return const SignUpView();
        } else {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
