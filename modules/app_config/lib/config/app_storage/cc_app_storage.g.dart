// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cc_app_storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CcAppStorageAdapter extends TypeAdapter<CcAppStorage> {
  @override
  final int typeId = 2;

  @override
  CcAppStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CcAppStorage(
      a_t: fields[0] as String?,
      f_t: fields[2] as String?,
      gps: fields[3] as String?,
      role: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CcAppStorage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.a_t)
      ..writeByte(2)
      ..write(obj.f_t)
      ..writeByte(3)
      ..write(obj.gps)
      ..writeByte(4)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CcAppStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CcAppStorage _$CcAppStorageFromJson(Map<String, dynamic> json) => CcAppStorage(
      a_t: json['a_t'] as String?,
      f_t: json['f_t'] as String?,
      gps: json['gps'] as String?,
      role: json['role'] as String?,
    )..user = json['user'] == null
        ? null
        : UserPrincipal.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$CcAppStorageToJson(CcAppStorage instance) =>
    <String, dynamic>{
      'a_t': instance.a_t,
      'f_t': instance.f_t,
      'gps': instance.gps,
      'role': instance.role,
      'user': instance.user,
    };
