import 'package:equatable/equatable.dart';

class ComplaintStatsModel extends Equatable {

  final int registered;
  final int inProcess;
  final int onHold;
  final int solved;
  final int total;

//<editor-fold desc="Data Methods">
  const ComplaintStatsModel({
    required this.registered,
    required this.inProcess,
    required this.onHold,
    required this.solved,
    required this.total,
  });

  @override
  String toString() {
    return 'ComplaintStatsModel{ registered: $registered, inProcess: $inProcess, onHold: $onHold, solved: $solved, total: $total}';
  }

  @override
  List<Object?> get props => [
    registered,
    inProcess,
    onHold,
    solved,
    total,
  ];

  ComplaintStatsModel copyWith({
    int? registered,
    int? inProcess,
    int? onHold,
    int? solved,
    int? total,
  }) {
    return ComplaintStatsModel(
      registered: registered ?? this.registered,
      inProcess: inProcess ?? this.inProcess,
      onHold: onHold ?? this.onHold,
      solved: solved ?? this.solved,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'registered': registered,
      'inProcess': inProcess,
      'onHold': onHold,
      'solved': solved,
    };
  }

  factory ComplaintStatsModel.fromMap(Map<String, dynamic> map) {
    int registered = int.parse(map['registered'].toString());
    int inProcess = int.parse(map['in_process'].toString());
    int onHold = int.parse(map['on_hold'].toString());
    int solved = int.parse(map['solved'].toString());

    return ComplaintStatsModel(
      registered: registered,
      inProcess: inProcess,
      onHold: onHold,
      solved: solved,
      total: registered + inProcess + onHold + solved,
    );
  }

//</editor-fold>
}
