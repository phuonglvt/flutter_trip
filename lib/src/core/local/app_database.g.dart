// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TripModelDao? _tripModelDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TripModel` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `destination` TEXT NOT NULL, `dateTime` TEXT NOT NULL, `risk` INTEGER, `description` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TripModelDao get tripModelDao {
    return _tripModelDaoInstance ??= _$TripModelDao(database, changeListener);
  }
}

class _$TripModelDao extends TripModelDao {
  _$TripModelDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _tripModelInsertionAdapter = InsertionAdapter(
            database,
            'TripModel',
            (TripModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'destination': item.destination,
                  'dateTime': item.dateTime,
                  'risk': item.risk == null ? null : (item.risk! ? 1 : 0),
                  'description': item.description
                },
            changeListener),
        _tripModelUpdateAdapter = UpdateAdapter(
            database,
            'TripModel',
            ['id'],
            (TripModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'destination': item.destination,
                  'dateTime': item.dateTime,
                  'risk': item.risk == null ? null : (item.risk! ? 1 : 0),
                  'description': item.description
                },
            changeListener),
        _tripModelDeletionAdapter = DeletionAdapter(
            database,
            'TripModel',
            ['id'],
            (TripModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'destination': item.destination,
                  'dateTime': item.dateTime,
                  'risk': item.risk == null ? null : (item.risk! ? 1 : 0),
                  'description': item.description
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TripModel> _tripModelInsertionAdapter;

  final UpdateAdapter<TripModel> _tripModelUpdateAdapter;

  final DeletionAdapter<TripModel> _tripModelDeletionAdapter;

  @override
  Future<List<TripModel>> getAllTripModels() async {
    return _queryAdapter.queryList('SELECT * FROM TripModel',
        mapper: (Map<String, Object?> row) => TripModel(
            id: row['id'] as int?,
            name: row['name'] as String,
            description: row['description'] as String,
            dateTime: row['dateTime'] as String,
            destination: row['destination'] as String,
            risk: row['risk'] == null ? null : (row['risk'] as int) != 0));
  }

  @override
  Stream<List<TripModel>> watchAllTripModels() {
    return _queryAdapter.queryListStream('SELECT * FROM TripModel',
        mapper: (Map<String, Object?> row) => TripModel(
            id: row['id'] as int?,
            name: row['name'] as String,
            description: row['description'] as String,
            dateTime: row['dateTime'] as String,
            destination: row['destination'] as String,
            risk: row['risk'] == null ? null : (row['risk'] as int) != 0),
        queryableName: 'TripModel',
        isView: false);
  }

  @override
  Future<TripModel?> findTripModelById(int id) async {
    return _queryAdapter.query('SELECT * FROM TripModel WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TripModel(
            id: row['id'] as int?,
            name: row['name'] as String,
            description: row['description'] as String,
            dateTime: row['dateTime'] as String,
            destination: row['destination'] as String,
            risk: row['risk'] == null ? null : (row['risk'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<void> insert(TripModel value) async {
    await _tripModelInsertionAdapter.insert(value, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertAll(List<TripModel> objects) async {
    await _tripModelInsertionAdapter.insertList(
        objects, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateObject(TripModel value) async {
    await _tripModelUpdateAdapter.update(value, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteObject(TripModel obj) async {
    await _tripModelDeletionAdapter.delete(obj);
  }

  @override
  Future<void> deleteAll(List<TripModel> lstObject) async {
    await _tripModelDeletionAdapter.deleteList(lstObject);
  }

  @override
  Future<void> deleteAllObject() async {
    if (database is sqflite.Transaction) {
      await super.deleteAllObject();
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.tripModelDao.deleteAllObject();
      });
    }
  }
}
