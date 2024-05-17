import 'package:chdtask/config/router/app_routes.dart';
import 'package:chdtask/core/di/di.dart';
import 'package:chdtask/features/login/presentation/manager/login_cubit.dart';
import 'package:chdtask/features/login/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const Duration kanimationDuration = Duration(seconds: 1);

class AppRouter {
  static Route<Widget> onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signIn:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => locator<LoginCubit>(),
            child: const Login(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          ),
        );
    }
  }
}
