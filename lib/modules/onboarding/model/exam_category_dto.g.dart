// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_category_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExamCategoryDTOAdapter extends TypeAdapter<ExamCategoryDTO> {
  @override
  final int typeId = 1;

  @override
  ExamCategoryDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExamCategoryDTO(
      id: fields[0] as String,
      title: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ExamCategoryDTO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamCategoryDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
