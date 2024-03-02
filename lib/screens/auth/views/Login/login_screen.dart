import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:status_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:status_app/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:status_app/screens/auth/views/Login/components/login_form.dart';
import 'components/login_screen_top_image.dart';
import 'package:status_app/responsive.dart';
import 'package:status_app/components/background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileLoginScreen(),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signInBloc =
        SignInBloc(context.read<AuthenticationBloc>().userRepository);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LoginScreenTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
                flex: 8,
                child: BlocProvider<SignInBloc>(
                  create: (_) => signInBloc,
                  child: const LoginForm(),
                )),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
