// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_record_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserRecordDbAdapter extends TypeAdapter<UserRecordDb> {
  @override
  final int typeId = 4;

  @override
  UserRecordDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserRecordDb(
      id: fields[0] as int?,
      image: fields[1] as String,
      recordName: fields[2] as String,
      date: fields[3] as String,
      reportType: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserRecordDb obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.recordName)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.reportType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRecordDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
