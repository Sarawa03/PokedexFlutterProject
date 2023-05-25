import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproject/constants/colors.dart';
import 'package:flutterproject/services/auth/auth_services.dart';
import 'package:flutterproject/services/auth/bloc/auth_bloc.dart';
import 'package:flutterproject/services/auth/bloc/auth_event.dart';
import 'package:flutterproject/services/auth/bloc/auth_state.dart';
import 'package:flutterproject/utilities/dialogs/logout_dialog.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final user = AuthService.firebase().currentuser;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {},
      child: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 75),
              child: Text(user!.email),
            ),
            Container(
                child: ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                      const AuthEventShouldRegister(),
                    );
              },
              style: ElevatedButton.styleFrom(backgroundColor: tAccentColor),
              child: const Text(
                'LOG OUT',
                style: TextStyle(color: Colors.black),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
