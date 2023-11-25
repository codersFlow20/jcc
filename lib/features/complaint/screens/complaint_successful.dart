import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jcc/common/widget/primary_button.dart';
import 'package:jcc/common/widget/primary_outline_button.dart';
import 'package:jcc/constants/assets_constants.dart';
import 'package:lottie/lottie.dart';

import '../../../bloc/complaint/complaint_bloc.dart';

class ComplaintSuccess extends StatelessWidget {
  const ComplaintSuccess({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 95,
              ),
              Lottie.asset(
                AssetsConstants.doneAnim,
                repeat: false,
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "Complaint Registered \nSuccessfully",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 20),
              Text(
                "You will receive updates related to this \ncomplaint shortly",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Complaint no. ',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    id,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              PrimaryOutlineButton(onTap: () {
                context.go('/complaints/complaint_details');
              }, title: 'Track Status'),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                onTap: () {
                  context.read<ComplaintBloc>().add(LoadComplaint());
                  context.go('/complaints');
                },
                title: 'Done',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
