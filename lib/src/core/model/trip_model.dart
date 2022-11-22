import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trip_model.g.dart';

@JsonSerializable()
@entity
class TripModel {
  TripModel({
    this.id,
    this.name = '',
    this.description = '',
    this.dateTime = '',
    this.destination = '',
    this.risk,
  });

  @PrimaryKey(autoGenerate: true)
  int? id;
  String name;
  String destination;
  String dateTime;
  bool? risk;
  String description;

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);

  Map<String, dynamic> toJson() => _$TripModelToJson(this);

  TripModel copyWith({
    int? id,
    String? name,
    String? destination,
    String? dateTime,
    bool? risk,
    String? description,
  }) =>
      TripModel(
        id: id ?? this.id,
        name: name ?? this.name,
        destination: destination ?? this.destination,
        dateTime: dateTime ?? this.dateTime,
        risk: risk ?? this.risk,
        description: description ?? this.description,
      );
}
