import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jcc/bloc/auth/auth_bloc.dart';
import 'package:jcc/bloc/auth/auth_bloc.dart';
import 'package:jcc/bloc/complaint/complaint_bloc.dart';
import 'package:jcc/bloc/complaint/stats/complaint_stats_bloc.dart';
import 'package:jcc/bloc/notification/notification_bloc.dart';
import 'package:jcc/constants/string_constants.dart';
import 'package:jcc/generated/assets.dart';
import 'package:jcc/theme/colors.dart';

import '../../bloc/user/register/user_register_bloc.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 320,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            dev.log('User logged out!', name: 'Auth');
            context.read<ComplaintBloc>().add(InitializeComplaint());
            context.read<NotificationBloc>().add(InitializeNotifications());
            context.read<ComplaintStatsBloc>().add(InitializeComplaintStats());
            context.read<UserRegisterBloc>().add(InitializeUser());
            context.go('/login');
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              SvgPicture.asset(
                Assets.backgroundsMenuBackground,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width <= 450
                    ? MediaQuery.of(context).size.height
                    : MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Column(
                      children: [
                        _buildHeaderDrawer(context),
                        const SizedBox(
                          height: 115,
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            Assets.iconsLanguage,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            CommonDataConstants.language,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            Assets.iconsAboutUs,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            CommonDataConstants.aboutUs,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            Assets.iconsHelp,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            CommonDataConstants.needAnyHelp,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const Spacer(),
                    ListTile(
                      leading: SvgPicture.asset(
                        Assets.iconsLogOut,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        CommonDataConstants.logOut,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      onTap: () {
                        context.read<AuthBloc>().add(LoggedOut());
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderDrawer(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: IconButton(
                    onPressed: () => Scaffold.of(context).closeDrawer(),
                    icon: SvgPicture.asset(
                      Assets.iconsClose,
                      fit: BoxFit.cover,
                    )),
              )
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                GestureDetector(
                  child: Hero(
                    tag: 'profile',
                    transitionOnUserGestures: true,
                    child: Container(
                      height: 75,
                      width: 75,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Image.asset(
                        Assets.imageProfileImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () => context.push(
                    '/user_profile',
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 2.5,
                  height: 45,
                  decoration: const BoxDecoration(
                    color: AppColors.black50,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                BlocBuilder<UserRegisterBloc, UserRegisterState>(
                  builder: (context, state) {
                    if (state is UserNotRegistered) {
                      return const Text('You need to register yourself!');
                    } else if (state is UserRegistered) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.user.name,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            state.user.phoneNo,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: AppColors.white,
                                ),
                          ),
                        ],
                      );
                    } else {
                      return const Text('Unknown state');
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
