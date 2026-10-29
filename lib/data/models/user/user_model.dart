import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    String? uid,
    String? email,
    String? password,
    String? address,
    String? fullName,
    String? userName,
    String? profileImage,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      uid: user.uid,
      email: user.email,
      address: user.address,
      fullName: user.fullName,
      userName: user.userName,
      profileImage: user.profileImage,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      email: email,
      address: address,
      fullName: fullName,
      userName: userName,
      profileImage: profileImage,
    );
  }
}
