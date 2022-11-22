part of 'edit_trip_bloc.dart';

@freezed
class EditTripState with _$EditTripState {
  const EditTripState._();

  const factory EditTripState({
    @Default(PageState.success) PageState pageStatus,
    PageCommand? pageCommand,
    required TripModel trip,
    TextEditingController? nameController,
    TextEditingController? destinationController,
    TextEditingController? dateController,
    TextEditingController? descriptionController,
    @Default(false) bool isEdit,
  }) = _EditTripState;
}
