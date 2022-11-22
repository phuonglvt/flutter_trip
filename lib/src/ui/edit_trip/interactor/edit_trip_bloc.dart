import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_demo/src/core/managers/navigator_manager.dart';
import 'package:trip_demo/src/core/model/trip_model.dart';
import 'package:trip_demo/src/core/repository/trip_model_repository.dart';
import 'package:trip_demo/src/ui/base/interactor/page_command.dart';
import 'package:trip_demo/src/ui/base/interactor/page_states.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_demo/src/ui/routing/pop_result.dart';
import 'package:trip_demo/src/utils/app_pages.dart';

part 'edit_trip_bloc.freezed.dart';
part 'edit_trip_event.dart';
part 'edit_trip_state.dart';

class EditTripBloc extends Bloc<EditTripEvent, EditTripState> {
  final TripModelRepository _tripModelRepository;
  EditTripBloc(
    this._tripModelRepository,
  ) : super(EditTripState(trip: TripModel())) {
    on<_Init>(_init);
    on<_OnEdit>(_onEdit);
    on<_OnCreated>(_onCreated);
    on<_OnDeleted>(_onDeleted);
    on<_SaveDate>(_saveDate);
    on<_SaveDescription>(_saveDescription);
    on<_SaveDestination>(_saveDestination);
    on<_SaveName>(_saveName);
    on<_SaveRiskAssessment>(_saveRiskAssessment);
    on<_OnClearPageCommand>(
        (event, emit) => emit(state.copyWith(pageCommand: null)));
  }

  Future<void> _init(_Init event, Emitter emit) async {
    final bool isEdit = Get.arguments != null;
    final TripModel trip =
        Get.arguments != null ? Get.arguments as TripModel : TripModel();
    TextEditingController nameController = TextEditingController();
    nameController.text = trip.name;
    TextEditingController destinationController = TextEditingController();
    destinationController.text = trip.destination;
    TextEditingController dateController = TextEditingController();
    dateController.text = trip.dateTime;
    TextEditingController descriptionController = TextEditingController();
    descriptionController.text = trip.description;
    emit(state.copyWith(
      trip: trip,
      isEdit: isEdit,
      nameController: nameController,
      descriptionController: descriptionController,
      dateController: dateController,
      destinationController: destinationController,
    ));
  }

  Future<void> _onEdit(_OnEdit event, Emitter emit) async {
    try {
      await _tripModelRepository.updateTripModel(state.trip);
      PageCommandDialog page = PageCommandDialog(
        content: 'Edit Success!!!',
        result: PopResult(
          resultFromPage: AppPages.allTrips,
          status: true,
        ),
      );
      emit(state.copyWith(pageCommand: page));
    } catch (ex) {
      print("edit fail $ex");
    }
  }

  Future<void> _onCreated(_OnCreated event, Emitter emit) async {
    try {
      if (_validateEmptyField()) {
        await _tripModelRepository.addTripModel(state.trip);
        final trip = state.trip;
        PageCommandDialog page = PageCommandDialog(
          content:
              'Name: ${trip.name}\nDestination: ${trip.destination}\nDate of the Trip: ${trip.dateTime}\nRisk Assessments: ${trip.risk! ? 'Yes' : 'No'}\nDescription: ${trip.description}',
          result: PopResult(
            resultFromPage: AppPages.allTrips,
            status: true,
          ),
        );
        emit(state.copyWith(pageCommand: page));
      } else {
        emit(
          state.copyWith(
            pageCommand: PageCommandDialog(
                content: 'You need to fill all required fields'),
          ),
        );
      }
    } catch (ex) {
      print("add failed $ex");
    }
  }

  Future<void> _onDeleted(_OnDeleted event, Emitter emit) async {
    try {
      await _tripModelRepository.deleteTripModelById(state.trip.id ?? 0);
      Get.find<NavigatorManager>().popBack(
          popResult: PopResult(
        status: true,
        resultFromPage: AppPages.allTrips,
        data: 'delete',
      ));
    } catch (ex) {
      print("edit failed $ex");
    }
  }

  Future<void> _saveDate(_SaveDate event, Emitter emit) async {
    try {
      TripModel trip = state.trip.copyWith(dateTime: event.date);
      emit(state.copyWith(trip: trip));
    } catch (ex) {
      print("_saveDate $ex");
    }
  }

  Future<void> _saveDestination(_SaveDestination event, Emitter emit) async {
    try {
      TripModel trip = state.trip.copyWith(destination: event.destination);
      emit(state.copyWith(trip: trip));
    } catch (ex) {
      print("_saveDestination $ex");
    }
  }

  Future<void> _saveDescription(_SaveDescription event, Emitter emit) async {
    try {
      TripModel trip = state.trip.copyWith(description: event.description);
      emit(state.copyWith(trip: trip));
    } catch (ex) {
      print("_saveDescription $ex");
    }
  }

  Future<void> _saveName(_SaveName event, Emitter emit) async {
    try {
      TripModel trip = state.trip.copyWith(name: event.name);
      emit(state.copyWith(trip: trip));
    } catch (ex) {
      print("_saveName $ex");
    }
  }

  Future<void> _saveRiskAssessment(
      _SaveRiskAssessment event, Emitter emit) async {
    try {
      TripModel trip = state.trip.copyWith(risk: event.isRisk);
      emit(state.copyWith(trip: trip));
    } catch (ex) {
      print("risk $ex");
    }
  }

  bool _validateEmptyField() {
    if (state.trip.risk == null ||
        state.descriptionController!.text.isEmpty ||
        state.nameController!.text.isEmpty ||
        state.destinationController!.text.isEmpty ||
        state.dateController!.text.isEmpty) {
      return false;
    }
    return true;
  }
}
