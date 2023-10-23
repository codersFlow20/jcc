import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/complaint_model.dart';

part 'complaint_register_event.dart';
part 'complaint_register_state.dart';

class ComplaintRegisterBloc extends Bloc<ComplaintRegisterEvent, ComplaintRegisterState> {
  ComplaintRegisterBloc() : super(ComplaintRegisterInitial()) {
    on<ComplaintRegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
