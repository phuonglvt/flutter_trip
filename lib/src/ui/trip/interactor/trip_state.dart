part of 'trip_bloc.dart';

@freezed
class TripState with _$TripState {
  const TripState._();

  const factory TripState({
    @Default(PageState.initial) PageState pageStatus,
    @Default([]) List<TripModel> trips,
    PageController? pageController,
    PageCommand? pageCommand,
    @Default('All Trips') String title,
    @Default(false) bool isEdit,
    int? currentId,
  }) = _TripState;
}
