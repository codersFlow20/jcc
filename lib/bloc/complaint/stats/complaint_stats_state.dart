part of 'complaint_stats_bloc.dart';

abstract class ComplaintStatsState extends Equatable {
  const ComplaintStatsState();

  @override
  List<Object> get props => [];
}

class ComplaintStatsInitial extends ComplaintStatsState {

}

class ComplaintStatsLoading extends ComplaintStatsState {}

class ComplaintStatsLoaded extends ComplaintStatsState {
  const ComplaintStatsLoaded(this.stats);

  final ComplaintStatsModel stats;

  @override
  List<Object> get props => [stats];
}

class ComplaintStatsError extends ComplaintStatsState {
  const ComplaintStatsError(this.message);

  final String message;
}
