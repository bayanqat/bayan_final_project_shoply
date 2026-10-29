// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  uid: json['uid'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  address: json['address'] as String?,
  fullName: json['fullName'] as String?,
  userName: json['userName'] as String?,
  profileImage: json['profileImage'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'password': instance.password,
      'address': instance.address,
      'fullName': instance.fullName,
      'userName': instance.userName,
      'profileImage': instance.profileImage,
    };
