import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:status_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:status_app/components/background.dart';
import 'package:status_app/responsive.dart';
import 'package:status_app/screens/auth/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:status_app/screens/auth/views/Signup/components/signup_form.dart';
import 'components/sign_up_top_image.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileSignupScreen(),
        ),
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signUpBloc =
        SignUpBloc(context.read<AuthenticationBloc>().userRepository);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SignUpScreenTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
                flex: 8,
                child: BlocProvider<SignUpBloc>(
                  create: (_) => signUpBloc,
                  child: const SignUpForm(),
                )),
            const Spacer(),
          ],
        ),
        // const SocalSignUp()
      ],
    );
  }
}
