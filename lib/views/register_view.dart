import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproject/constants/colors.dart';
import 'package:flutterproject/constants/sizes.dart';
import 'package:flutterproject/services/auth/auth_exceptions.dart';
import 'package:flutterproject/services/auth/bloc/auth_bloc.dart';
import 'package:flutterproject/services/auth/bloc/auth_event.dart';
import 'package:flutterproject/services/auth/bloc/auth_state.dart';
import 'package:flutterproject/utilities/dialogs/error_dialog.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _password2;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _password2 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _password2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateRegistering) {
          if (state is WeakPasswordAuthException) {
            await showErrorDialog(context, 'WeakPassword');
          } else if (state is EmailAlreadyInUseAuthException) {
            await showErrorDialog(context, 'Email is already in use');
          } else if (state is GenericAuthException) {
            await showErrorDialog(context, 'Failed to register');
          } else if (state.exception is InvalidEmailAuthException) {
            await showErrorDialog(context, 'Invalid email');
          }
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const SizedBox(height: tFormHeight * 2),
                const Text(
                  'Sign Up',
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
                          prefixIcon: const Icon(Icons.person_outline_outlined),
                          labelText: 'Email',
                          hintText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: tAccentColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: tAccentColor),
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
                            borderSide: const BorderSide(color: tAccentColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: tAccentColor),
                          ),
                          suffixIcon: const IconButton(
                            onPressed: null,
                            icon: Icon(Icons.remove_red_eye_sharp),
                          ),
                        ),
                      ),
                      const SizedBox(height: tFormHeight),
                      TextFormField(
                        controller: _password2,
                        decoration: InputDecoration(
                          focusColor: tAccentColor,
                          prefixIcon: const Icon(Icons.password),
                          labelText: 'Repeat your password',
                          hintText: 'Repeat your password',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: tAccentColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: tAccentColor),
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
                            final password2 = _password2.text;
                            if (password != password2) {
                              await showErrorDialog(
                                  context, 'Password doesnt match');
                            } else {
                              context.read<AuthBloc>().add(AuthEventRegister(
                                    email,
                                    password,
                                  ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: tAccentColor),
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  const AuthEventLogOut(),
                                );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: tAccentColor),
                          child: const Text(
                            'LOG IN',
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
                        onPressed: () {},
                        label: const Text(
                          'Sign with Google',
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
    );
  }
}
