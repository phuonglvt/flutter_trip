part of 'trip_bloc.dart';

@freezed
class TripEvent with _$TripEvent {
  const factory TripEvent.fetchAllData() = _FetchAllData;
  const factory TripEvent.deleteAll() = _DeleteAll;
  const factory TripEvent.onNavigateToEdit(TripModel? tripModel) =
      _OnNavigateToEdit;
  const factory TripEvent.onShowToastDeleted() = _OnShowToastDeleted;
  const factory TripEvent.onClearPageCommand() = _OnClearPageCommand;
}
