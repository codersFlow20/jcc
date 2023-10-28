

import 'package:flutter/cupertino.dart';
import 'package:jcc/features/home/screens/home_screen.dart';
import 'package:jcc/theme/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DataChart extends StatelessWidget {
  DataChart({super.key, required this.complaintStateData});


  final cardBackgroundColors = const [
    AppColors.brightTurquoise,
    AppColors.monaLisa,
    AppColors.heliotrope,
    AppColors.mantis,
  ];

  final List<ComplaintStateData> complaintStateData;
  final TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);
  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      tooltipBehavior: tooltipBehavior,
      series: <CircularSeries>[
        DoughnutSeries<ComplaintStateData,String>(
          dataSource: complaintStateData,
          xValueMapper: (ComplaintStateData data, _) => data.complaintState,
          sortFieldValueMapper: (ComplaintStateData data, _) => data.complaintDataInNumber,
          yValueMapper: (ComplaintStateData data, _) => data.complaintsDataInPercentage,
          dataLabelMapper: (ComplaintStateData data, _) => "${data.complaintsDataInPercentage.toInt()}%",
          pointColorMapper: (ComplaintStateData data, _) => data.color,
          dataLabelSettings: const DataLabelSettings(isVisible: true,),
          radius: '125',
          enableTooltip: true,
          innerRadius: '65%',
        )
      ],
    );
  }
}

