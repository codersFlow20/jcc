import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jcc/constants/string_constants.dart';
import 'package:jcc/generated/assets.dart';
import 'package:jcc/theme/colors.dart';

class ComplaintDetails extends StatelessWidget {
  // final ComplaintModel complaint;
  const ComplaintDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            Assets.iconsBackArrow,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          CommonDataConstants.complaintDetails,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 22,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 20) / 2,
                    child: _buildDataFiled(
                      context: context,
                      title: ScreensDataConstants.complaintNo,
                      text: "45",
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 20) / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ScreensDataConstants.status,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              decoration: const BoxDecoration(
                                color: AppColors.brightTurquoise,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Registered",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 20) / 2,
                    child: _buildDataFiled(
                      context: context,
                      title: ScreensDataConstants.registrationDate,
                      text: "24th August, 2004 Friday, 10:00 PM",
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 20) / 2,
                    child: _buildDataFiled(
                      context: context,
                      title: ScreensDataConstants.durationOfCompletion,
                      text: "120 Hours",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              _buildDataFiled(
                context: context,
                title: ScreensDataConstants.department,
                text: "Water Works",
              ),
              const SizedBox(
                height: 15,
              ),
              _buildDataFiled(
                context: context,
                title: ScreensDataConstants.subject,
                text: "Low Pressure of water",
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 20) / 2,
                    child: _buildDataFiled(
                      context: context,
                      title: ScreensDataConstants.areaName,
                      text: "Community Hall",
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 20) / 2,
                    child: _buildDataFiled(
                      context: context,
                      title: ScreensDataConstants.wardNo,
                      text: "1",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              _buildDataFiled(
                context: context,
                title: ScreensDataConstants.address,
                text: "Near swaminarayan temple, Unknown Planet - 404",
              ),
              const SizedBox(
                height: 15,
              ),
              _buildDataFiled(
                context: context,
                title: ScreensDataConstants.description,
                text:
                    "There's a low pressure of water in our area due to some reasons, fix it within 34 hours",
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 15,
              ),
              _buildDataFiled(
                context: context,
                title: ScreensDataConstants.applicantName,
                text: "Parshottambhai Patidar",
              ),
              const SizedBox(
                height: 15,
              ),
              _buildDataFiled(
                context: context,
                title: ScreensDataConstants.applicantMobileNo,
                text: "+91 9662430978",
              ),
              const SizedBox(
                height: 15,
              ),
              _buildDataFiled(
                context: context,
                title: ScreensDataConstants.remarks,
                text:
                    "New pipe line was installed in the area and complaint solved successfully within time!",
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                ScreensDataConstants.photographs,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 250,
                    width: 187.5,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Image.asset(
                      Assets.imageProfileImage,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: 3,
              ),
              const SizedBox(
                height: 15,
              ),
              _buildDataFiled(
                context: context,
                title: ScreensDataConstants.completionCode,
                text: "123 456",
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDataFiled(
    {required BuildContext context,
    required String title,
    required String text}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
      )
    ],
  );
}
