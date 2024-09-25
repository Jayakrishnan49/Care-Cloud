// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vitals_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VitalsDbAdapter extends TypeAdapter<VitalsDb> {
  @override
  final int typeId = 2;

  @override
  VitalsDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VitalsDb(
      id: fields[0] as int?,
      date: fields[1] as String,
      time: fields[2] as String,
      bp: fields[3] as String?,
      pulse: fields[4] as String?,
      temperature: fields[5] as String?,
      weight: fields[6] as String?,
      spo2: fields[7] as String?,
      exercise: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, VitalsDb obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.bp)
      ..writeByte(4)
      ..write(obj.pulse)
      ..writeByte(5)
      ..write(obj.temperature)
      ..writeByte(6)
      ..write(obj.weight)
      ..writeByte(7)
      ..write(obj.spo2)
      ..writeByte(8)
      ..write(obj.exercise);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VitalsDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
