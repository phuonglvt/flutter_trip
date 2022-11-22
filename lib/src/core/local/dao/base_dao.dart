import 'package:floor/floor.dart';

abstract class BaseDAO<T> {
  // TODO use OnConflictStrategy to set conflict
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(T value);

  // TODO use OnConflictStrategy to set conflict
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAll(List<T> objects);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateObject(T value);

  @delete
  Future<void> deleteObject(T obj);

  @delete
  Future<void> deleteAll(List<T> lstObject);

  @transaction
  Future<void> deleteAllObject() async {
    // FIXME: process to get class name instead of get from param

    // String table = T.runtimeType.toString();
    //
    // if (T is Entity) print('table ${table}');
    // if (!table.isNullOrEmpty()) {
    //   var lst = await findAll(table);
    //   await deleteAll(lst);
    // }
  }
}
