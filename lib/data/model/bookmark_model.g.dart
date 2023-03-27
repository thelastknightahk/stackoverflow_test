// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookMarkModelAdapter extends TypeAdapter<BookMarkModel> {
  @override
  final int typeId = 1;

  @override
  BookMarkModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookMarkModel(
      accountId: fields[0] as int?,
      reputation: fields[1] as int?,
      creationDate: fields[2] as int?,
      userId: fields[3] as int?,
      location: fields[4] as String?,
      profileImage: fields[5] as String?,
      displayName: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookMarkModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.accountId)
      ..writeByte(1)
      ..write(obj.reputation)
      ..writeByte(2)
      ..write(obj.creationDate)
      ..writeByte(3)
      ..write(obj.userId)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.profileImage)
      ..writeByte(6)
      ..write(obj.displayName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookMarkModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
