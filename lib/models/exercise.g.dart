// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseAdapter extends TypeAdapter<Exercise> {
  @override
  final int typeId = 1;

  @override
  Exercise read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Exercise(
      id: fields[0] as int,
      name: fields[1] as String,
      category: fields[2] as int,
      equipment: (fields[3] as List)?.cast<dynamic>(),
      description: fields[4] as String,
      mainMuscles: (fields[5] as List)?.cast<dynamic>(),
      secondaryMuscles: (fields[6] as List)?.cast<dynamic>(),
      imageUrl: fields[7] as String,
      selectedForWorkout: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Exercise obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.equipment)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.mainMuscles)
      ..writeByte(6)
      ..write(obj.secondaryMuscles)
      ..writeByte(7)
      ..write(obj.imageUrl)
      ..writeByte(8)
      ..write(obj.selectedForWorkout);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
