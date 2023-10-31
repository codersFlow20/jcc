import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jcc/theme/colors.dart';
import 'package:lottie/lottie.dart';
import '../../../bloc/complaint/complaint_bloc.dart';
import '../../../constants/assets_constants.dart';
import '../widgets/complaint_widget.dart';
import 'package:jcc/common/widget/menu_drawer.dart';
import 'package:jcc/generated/assets.dart';
import '../../../common/widget/scroll_to_hide_widget.dart';

class ComplaintList extends StatefulWidget {
  const ComplaintList({
    super.key,
    required this.controller,
    required this.bottomNavKey,
  });

  final ScrollController controller;
  final GlobalKey<ScrollToHideWidgetState> bottomNavKey;

  @override
  State<ComplaintList> createState() => _ComplaintListState();
}

class _ComplaintListState extends State<ComplaintList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 85,
        ),
        child: FloatingActionButton.extended(
          label: Text(
            "Register Complaint",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
          ),
          icon: SvgPicture.asset(AssetsConstants.edit),
          onPressed: () {
            context.push('/complaint_register');
          },
          backgroundColor: AppColors.greenBlue,
        ),
      ),
      drawer: const MenuDrawer(),
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: SvgPicture.asset(Assets.iconsMenu,fit: BoxFit.cover,),
          ),
        ),
        title: const Text(
          'Complaints',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          )
        ],
      ),
      body: BlocBuilder<ComplaintBloc, ComplaintState>(
        builder: (context, state) {
          if (state is ComplaintLoading || state is ComplaintInitial) {
            const CircularProgressIndicator();
          } else if (state is ComplaintLoaded) {
            if (state.complaintList.isEmpty) {
              return Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Lottie.asset(
                    AssetsConstants.searchAnim,
                    repeat: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Nothing to Show',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              );
            } else {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: ListView.builder(
                  controller: widget.controller,
                  itemBuilder: (context, index) {
                    return ComplaintWidget(
                      complaint: state.complaintList[index],
                    );
                  },
                  itemCount: state.complaintList.length,
                ),
              );
            }
          } else if (state is ComplaintError) {
            return Text(state.message);
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
