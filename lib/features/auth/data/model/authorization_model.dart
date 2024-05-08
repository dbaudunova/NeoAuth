import 'package:json_annotation/json_annotation.dart';
import 'package:neo_auth/features/auth/domain/model/authorization_entity.dart';

part 'authorization_model.g.dart';

@JsonSerializable()
class AuthorizationModel extends AuthorizationEntity {
  AuthorizationModel({
    super.id,
    super.username,
    super.password,
  });

  factory AuthorizationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationModelToJson(this);
}
