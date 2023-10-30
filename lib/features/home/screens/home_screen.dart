import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jcc/bloc/complaint/stats/complaint_stats_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // var name = (context
    //     .read<UserRegisterBloc>()
    //     .state as UserRegistered).user.name;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: BlocBuilder<ComplaintStatsBloc, ComplaintStatsState>(
        builder: (context, state) {
          if (state is ComplaintStatsLoaded) {
            return Column(
              children: [
                Text('Registered: ${state.stats.registered}'),
                Text('In Process: ${state.stats.inProcess}'),
                Text('On Hold: ${state.stats.onHold}'),
                Text('Solved: ${state.stats.solved}'),
                Text('Total: ${state.stats.total}'),
              ],
            );
          }else if (state is ComplaintStatsLoading) {
            return const CircularProgressIndicator();
          }else if (state is ComplaintStatsError) {
            return Text('Got error: ${state.message}');
          }else {
            return const Text('Unknown state');
          }
        },
      ),
    );
  }
}
