part of 'edit_trip_bloc.dart';

@freezed
class EditTripEvent with _$EditTripEvent {
  const factory EditTripEvent.init() = _Init;
  const factory EditTripEvent.onEdit() = _OnEdit;
  const factory EditTripEvent.onCreated() = _OnCreated;
  const factory EditTripEvent.onDeleted() = _OnDeleted;
  const factory EditTripEvent.saveName(String name) = _SaveName;
  const factory EditTripEvent.saveDestination(String destination) =
      _SaveDestination;
  const factory EditTripEvent.saveDate(String date) = _SaveDate;
  const factory EditTripEvent.saveDescription(String description) =
      _SaveDescription;
  const factory EditTripEvent.saveRiskAssessment(bool isRisk) =
      _SaveRiskAssessment;
  const factory EditTripEvent.onClearPageCommand() = _OnClearPageCommand;
}
