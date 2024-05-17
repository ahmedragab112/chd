import 'package:chdtask/features/signup/presentation/widgets/signup_body.dart';
import 'package:flutter/material.dart';


class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SignUpBody(),
          )
        ],
      ),
    ));
  }
}

