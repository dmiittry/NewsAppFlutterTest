// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ReadEvent {}

class inReadEvent extends ReadEvent {}

class noReadEvent extends ReadEvent {}

class ReadBloc extends Bloc<ReadEvent, Widget> {
  ReadBloc()
      : super(const Tooltip(message: 'unread', child: Icon(Icons.done))) {
    on<inReadEvent>((event, emit) {
      emit(const Tooltip(message: 'read', child: Icon(Icons.done_all)));
    });
    on<noReadEvent>((event, emit) {
      emit(const Tooltip(message: 'unread', child: Icon(Icons.done)));
    });
  }
}
