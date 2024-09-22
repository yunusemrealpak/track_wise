// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_do_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenseDoModelAdapter extends TypeAdapter<ExpenseDoModel> {
  @override
  final int typeId = 0;

  @override
  ExpenseDoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpenseDoModel(
      amount: fields[3] as double?,
      categoryId: fields[1] as String?,
      date: fields[2] as DateTime?,
      id: fields[0] as String?,
      title: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ExpenseDoModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.categoryId)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseDoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
