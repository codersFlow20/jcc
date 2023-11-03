import 'package:flutter/material.dart';
import 'package:jcc/generated/assets.dart';
import 'package:jcc/theme/colors.dart';

class RecentComplaintsCard extends StatelessWidget {
  const RecentComplaintsCard({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: 150,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: AppColors.paleBlue),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: Image.asset(Assets.departmentIconsWaterDepartment,
                  fit: BoxFit.cover),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fri, 12 Oct 2023, 10:00pm",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Water Works",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Irregular Water",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: _buildSelectColor(
                            status: "In Process",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Registered",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("Complaint no. ",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w300)),
                      Text(
                        "45",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "registered by ",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        "Yash Parmar",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Color _buildSelectColor({required String status}) {
    switch (status) {
      case 'Registered':
        return AppColors.brightTurquoise;
      case 'In Process':
        return AppColors.heliotrope;
      case 'On Hold':
        return AppColors.monaLisa;
      default:
        return AppColors.mantis;
    }
  }
}
