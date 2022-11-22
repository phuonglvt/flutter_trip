import 'package:trip_demo/src/core/model/trip_model.dart';
import 'package:trip_demo/src/core/repository/trip_model_repository.dart';
import 'package:trip_demo/src/ui/base/interactor/base_usecase.dart';

class FetchAllTripsUseCase extends NoInputStreamUseCase<List<TripModel>> {
  final TripModelRepository _tripModelRepository;

  FetchAllTripsUseCase(this._tripModelRepository);

  @override
  Stream<List<TripModel>> watch() {
    return _tripModelRepository.watchTripModels();
  }
}
