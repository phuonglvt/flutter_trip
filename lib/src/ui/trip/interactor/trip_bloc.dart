import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:trip_demo/src/core/model/trip_model.dart';
import 'package:trip_demo/src/core/repository/trip_model_repository.dart';
import 'package:trip_demo/src/ui/base/interactor/page_command.dart';
import 'package:trip_demo/src/ui/base/interactor/page_states.dart';
import 'package:trip_demo/src/ui/trip/usecases/fetch_all_trips_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_demo/src/utils/app_pages.dart';

part 'trip_bloc.freezed.dart';
part 'trip_event.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final TripModelRepository _tripModelRepository;
  final FetchAllTripsUseCase _fetchAllTripsUseCase;
  TripBloc(
    this._fetchAllTripsUseCase,
    this._tripModelRepository,
  ) : super(const TripState()) {
    on<_FetchAllData>(_fetchAllData);
    on<_DeleteAll>(_deleteAll);
    on<_OnNavigateToEdit>(_onNavigateToEdit);
    on<_OnShowToastDeleted>(_onShowToastDeleted);
    on<_OnClearPageCommand>(
        (event, emit) => emit(state.copyWith(pageCommand: null)));
  }

  Future<void> _fetchAllData(_FetchAllData event, Emitter emit) async {
    await emit.forEach<List<TripModel>>(
      _fetchAllTripsUseCase.watch(),
      onError: (error, StackTrace stackTrace) {
        return state;
      },
      onData: (List<TripModel> trips) {
        return state.copyWith(trips: trips, pageStatus: PageState.success);
      },
    );
  }

  Future<void> _deleteAll(_DeleteAll event, Emitter emit) async {
    _tripModelRepository.deleteAllTripModels();
  }

  Future<void> _onNavigateToEdit(_OnNavigateToEdit event, Emitter emit) async {
    PageCommandNavigatorPage pageCommand = PageCommandNavigatorPage(
        page: AppPages.editTrip, argument: event.tripModel);
    emit(state.copyWith(pageCommand: pageCommand));
  }

  Future<void> _onShowToastDeleted(
      _OnShowToastDeleted event, Emitter emit) async {
    PageCommandShowToast page = PageCommandShowToast('Delete Success');
    emit(state.copyWith(pageCommand: page));
  }
}
