// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_account_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileDbAdapter extends TypeAdapter<ProfileDb> {
  @override
  final int typeId = 1;

  @override
  ProfileDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileDb(
      id: fields[0] as int?,
      username: fields[1] as String,
      phoneno: fields[2] as String,
      gender: fields[3] as String,
      age: fields[4] as String,
      address: fields[5] as String?,
      pincode: fields[6] as String?,
      city: fields[7] as String?,
      image: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileDb obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.phoneno)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.age)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.pincode)
      ..writeByte(7)
      ..write(obj.city)
      ..writeByte(8)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
