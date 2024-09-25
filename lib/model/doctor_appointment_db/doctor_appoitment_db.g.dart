// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_appoitment_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoctorAppoitmentDbAdapter extends TypeAdapter<DoctorAppoitmentDb> {
  @override
  final int typeId = 5;

  @override
  DoctorAppoitmentDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DoctorAppoitmentDb(
      id: fields[0] as int?,
      doctorName: fields[1] as String,
      hospitalName: fields[2] as String,
      date: fields[3] as String,
      time: fields[4] as String,
      address: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DoctorAppoitmentDb obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.doctorName)
      ..writeByte(2)
      ..write(obj.hospitalName)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorAppoitmentDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
