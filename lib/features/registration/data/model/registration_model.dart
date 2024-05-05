import 'package:json_annotation/json_annotation.dart';
import 'package:neo_auth/features/registration/domain/model/registration_entity.dart';

part 'registration_model.g.dart';

@JsonSerializable()
class RegistrationModel extends RegistrationEntity {
  RegistrationModel({
    super.id,
    super.email,
    super.username,
    super.password,
});

  factory RegistrationModel.fromJson(Map<String, dynamic> json) => _$RegistrationModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegistrationModelToJson(this);
}