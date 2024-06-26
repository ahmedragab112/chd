import 'package:animate_do/animate_do.dart';
import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:flutter/material.dart';

class TitleAndMenu extends StatelessWidget {
  const TitleAndMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BounceInDown(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          Expanded(
              child: Text(
            'The Insurance',
            style: AppTextStyle.font24ExtraBoldBlack
                .copyWith(color: AppColor.primeryColor),
            textAlign: TextAlign.center,
          ))
        ],
      ),
    );
  }
}
