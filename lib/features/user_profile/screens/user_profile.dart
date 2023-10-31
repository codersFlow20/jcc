import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jcc/constants/string_constants.dart';
import 'package:jcc/generated/assets.dart';
import 'package:jcc/theme/colors.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: SvgPicture.asset(
              Assets.iconsBackArrow,
              fit: BoxFit.cover,
            )),
        title: Text(CommonDataConstants.userProfile,
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(fontSize: 22)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(Assets.iconsEdit,color: AppColors.black,))
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset(
              Assets.backgroundsUserProfileBackground,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'profile',
                      child: Container(
                        height: 180,
                        width: 260,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Image.asset(Assets.imageProfileImage),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
