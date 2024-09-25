// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_glucose_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BloodGlucoseDbAdapter extends TypeAdapter<BloodGlucoseDb> {
  @override
  final int typeId = 3;

  @override
  BloodGlucoseDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BloodGlucoseDb(
      id: fields[0] as int?,
      date: fields[1] as String,
      time: fields[2] as String,
      glucose: fields[3] as String,
      foodIntakeTimings: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BloodGlucoseDb obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.glucose)
      ..writeByte(4)
      ..write(obj.foodIntakeTimings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BloodGlucoseDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
