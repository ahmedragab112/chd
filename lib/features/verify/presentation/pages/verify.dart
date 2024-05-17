import 'package:chdtask/features/verify/presentation/widgets/verify_body.dart';
import 'package:flutter/material.dart';

class Verify extends StatelessWidget {
  const Verify({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: VerifyBody(),
          )
        ]),
      ),
    );
  }
}
