// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripModel _$TripModelFromJson(Map<String, dynamic> json) => TripModel(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      dateTime: json['dateTime'] as String? ?? '',
      destination: json['destination'] as String? ?? '',
      risk: json['risk'] as bool?,
    );

Map<String, dynamic> _$TripModelToJson(TripModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'destination': instance.destination,
      'dateTime': instance.dateTime,
      'risk': instance.risk,
      'description': instance.description,
    };
