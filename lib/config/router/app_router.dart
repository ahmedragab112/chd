import 'package:chdtask/config/router/app_routes.dart';
import 'package:chdtask/core/di/di.dart';
import 'package:chdtask/features/home/presentation/manager/homecubit_cubit.dart';
import 'package:chdtask/features/home/presentation/pages/home.dart';
import 'package:chdtask/features/login/presentation/manager/login_cubit.dart';
import 'package:chdtask/features/login/presentation/pages/login.dart';
import 'package:chdtask/features/signup/presentation/manager/singup_cubit.dart';
import 'package:chdtask/features/signup/presentation/pages/signup.dart';
import 'package:chdtask/features/user/presentation/manager/profile_cubit.dart';
import 'package:chdtask/features/user/presentation/pages/user_profile.dart';
import 'package:chdtask/features/verify/presentation/manager/verify_cubit.dart';
import 'package:chdtask/features/verify/presentation/pages/verify.dart';
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

      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => locator<SingupCubit>(),
            child: const SignUp(),
          ),
        );

      case AppRoutes.verify:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => locator<VerifyCubit>(),
            child: const Verify(),
          ),
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => locator<HomeCubit>()..getProduct(),
            child: const Home(),
          ),
        );
      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => locator<ProfileCubit>()..getProfile(),
            child: const Profile(),
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
