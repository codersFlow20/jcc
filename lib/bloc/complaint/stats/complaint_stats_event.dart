part of 'complaint_stats_bloc.dart';

abstract class ComplaintStatsEvent extends Equatable {
  const ComplaintStatsEvent();

  @override
  List<Object?> get props => [];
}

class InitializeComplaintStats extends ComplaintStatsEvent {}

class GetComplaintStats extends ComplaintStatsEvent {}

class UpdateStats extends ComplaintStatsEvent {
  const UpdateStats(this.complaintStats);

  final ComplaintStatsModel complaintStats;
}
