// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userpassword_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserPassDbAdapter extends TypeAdapter<UserPassDb> {
  @override
  final int typeId = 0;

  @override
  UserPassDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserPassDb(
      id: fields[0] as int?,
      username: fields[1] as String,
      password: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserPassDb obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPassDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
