import 'package:floor/floor.dart';
import 'package:trip_demo/src/core/local/dao/base_dao.dart';
import 'package:trip_demo/src/core/model/trip_model.dart';

@dao
abstract class TripModelDao extends BaseDAO<TripModel> {
  @Query('SELECT * FROM TripModel')
  Future<List<TripModel>> getAllTripModels();

  @Query('SELECT * FROM TripModel')
  Stream<List<TripModel>> watchAllTripModels();

  @Query('SELECT * FROM TripModel WHERE id = :id')
  Future<TripModel?> findTripModelById(int id);

  Future<void> deleteTripModelById(int id) async {
    TripModel? trip = await findTripModelById(id);
    if (trip != null) {
      await deleteObject(trip);
    }
  }

  Future<void> deleteAllTripModel() async {
    final localData = await getAllTripModels();
    if (localData.isNotEmpty) {
      await deleteAll(localData);
    }
  }
}
