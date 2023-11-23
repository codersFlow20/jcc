import 'package:flutter/material.dart';
import 'package:jcc/constants/string_constants.dart';
import 'package:jcc/features/home/screens/home_screen.dart';
import 'package:jcc/theme/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DataCard extends StatelessWidget {
  DataCard({super.key, required this.index, required this.complaintStateData, required this.label});

  final cardBackgroundColors = const [
    AppColors.brightTurquoise,
    AppColors.monaLisa,
    AppColors.heliotrope,
    AppColors.mantis,
  ];

  final cardLoadingColors = [
    AppColors.vividCerulean,
    AppColors.red,
    AppColors.violet,
    AppColors.islamicGreen,
  ];
  final ComplaintStateData complaintStateData;
  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 140,
        width: (MediaQuery.of(context).size.width - 30) / 2,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: AppColors.black25,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(0.0, 2.0), // shadow direction: bottom right
              )
            ],
            borderRadius: _buildDataCardBorderRadius(index: index),
            color: AppColors.white),
        child: Stack(children: [
          Column(
            children: [
              Container(
                height: 70,
                width: (MediaQuery.of(context).size.width - 30) / 2,
                decoration: BoxDecoration(
                  color: cardBackgroundColors[index],
                ),
                child: Center(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600, color: AppColors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  complaintStateData.complaintDataInNumber,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Center(
                child: Text(
                  ComplaintStateDataConstants.complaintStateStatement[index],
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            ],
          ),
          Center(
              child: SizedBox(
            height: 50,
            width: 50,
            child: Stack(children: [
              Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: cardBackgroundColors[index],
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.black25,
                        blurRadius: 3.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(0.0, 0.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                ),
              ),
              _buildRadialGraph(context, index: index),
            ]),
          ))
        ]),
      ),
    );
  }

  Widget _buildRadialGraph(BuildContext context, {required int index}) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          startAngle: 90,
          endAngle: 90,
          showTicks: false,
          showLabels: false,
          axisLineStyle: const AxisLineStyle(thickness: 0),
          pointers: <GaugePointer>[
            RangePointer(
              value: complaintStateData.complaintsDataInPercentage,
              color: cardLoadingColors[index],
              width: 6,
              enableAnimation: true,
              cornerStyle: CornerStyle.bothCurve,
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Center(
              child: Text(
                "${complaintStateData.complaintsDataInPercentage.toInt()}%",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
              ),
            ))
          ],
        ),
      ],
    );
  }

  BorderRadius _buildDataCardBorderRadius({required int index}) {
    switch (index) {
      case 0:
        return const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5));
      case 1:
        return const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5));
      case 2:
        return const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(5));
      default:
        return const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(15));
    }
  }
}
