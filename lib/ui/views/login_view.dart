import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproject/constants/colors.dart';
import 'package:flutterproject/constants/sizes.dart';
import 'package:flutterproject/services/auth/auth_exceptions.dart';
import 'package:flutterproject/services/auth/bloc/auth_bloc.dart';
import 'package:flutterproject/services/auth/bloc/auth_event.dart';
import 'package:flutterproject/services/auth/bloc/auth_state.dart';
import 'package:flutterproject/utilities/dialogs/error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
        if (state is AuthStateLoggedOut) {
          if (state.exception is UserNotFoundAuthException) {
            await showErrorDialog(
                context, 'Cannot find a user with the entered credentials');
          } else if (state.exception is WrongPasswordAuthException) {
            await showErrorDialog(context, 'Wrong credentials');
          } else if (state.exception is GenericAuthException) {
            await showErrorDialog(context, 'Authentication error');
          }
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                children: [
                  const Text(
                    'Log In',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Form(
                      child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: tFormHeight - 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.person_outline_outlined),
                            labelText: 'Email',
                            hintText: 'Email',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: tLightGrey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: tAccentColor, width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(height: tFormHeight),
                        TextFormField(
                          controller: _password,
                          decoration: InputDecoration(
                            focusColor: tAccentColor,
                            prefixIcon: const Icon(Icons.password),
                            labelText: 'Password',
                            hintText: 'Password',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: tLightGrey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: tAccentColor, width: 2),
                            ),
                            suffixIcon: const IconButton(
                              onPressed: null,
                              icon: Icon(Icons.remove_red_eye_sharp),
                            ),
                          ),
                        ),
                        const SizedBox(height: tFormHeight - 10),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: null,
                              child: Text('Forgot your password?')),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              final email = _email.text;
                              final password = _password.text;
                              context.read<AuthBloc>().add(
                                    AuthEventLogIn(
                                      email,
                                      password,
                                    ),
                                  );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: tAccentColor),
                            child: const Text(
                              'LOG IN',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                    const AuthEventShouldRegister(),
                                  );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: tAccentColor),
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: const Divider(
                                color: tLightGrey,
                                thickness: 1,
                              ),
                            ),
                          ),
                          const Text('OR'),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: const Divider(
                                color: tLightGrey,
                                thickness: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          icon: const Image(
                              image: AssetImage('assets/images/google_img.png'),
                              width: 20.0),
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEventSignInWithGoogle());
                          },
                          label: const Text(
                            'Sign-In with Google',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: tFormHeight - 20),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
