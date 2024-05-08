// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationModel _$AuthorizationModelFromJson(Map<String, dynamic> json) =>
    AuthorizationModel(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AuthorizationModelToJson(AuthorizationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
    };
