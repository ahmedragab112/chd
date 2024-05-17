
import 'package:chdtask/config/router/app_routes.dart';
import 'package:chdtask/core/di/di.dart';
import 'package:chdtask/core/extension/extension.dart';
import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:flutter/material.dart';

import '../../../../core/cache/cache_helper.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: AppColor.primeryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              SizedBox(height: 10),
              Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Profile'),
          onTap: () {
            context.pushNamed(AppRoutes.profile);
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () async {
            await locator<CacheHelper>().clear().then((value) {
              context.pushNamedAndRemoveUntil(AppRoutes.signIn);
            });
          },
        ),
      ],
    );
  }
}
