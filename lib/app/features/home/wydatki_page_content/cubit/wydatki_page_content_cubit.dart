// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
part 'wydatki_page_content_state.dart';

class WydatkiPageContentCubit extends Cubit<WydatkiPageContentState> {
  WydatkiPageContentCubit()
      : super(
          const WydatkiPageContentState(
            documentes: [],
            errorMessage: '',
            isloading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const WydatkiPageContentState(
        documentes: [],
        errorMessage: '',
        isloading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('wydatki_samochod')
        .orderBy('data')
        .snapshots()
        .listen((data) {
      emit(
        WydatkiPageContentState(
          documentes: data.docs,
          isloading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          WydatkiPageContentState(
            documentes: const [],
            isloading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
