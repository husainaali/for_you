// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['user_id'] as int?,
      userName: json['user_name'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      fullName: json['full_name'] as String?,
      address: json['address'] as String?,
      contactNo1: json['contact_no1'] as String?,
      contactNo2: json['contact_no2'] as String?,
      registrationDate: json['registration_date'] as String?,
      lastLogin: json['last_login'] as String?,
      role: json['role'] as String?,
      identityNo: json['identity_no'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
      'password': instance.password,
      'email': instance.email,
      'full_name': instance.fullName,
      'address': instance.address,
      'contact_no1': instance.contactNo1,
      'contact_no2': instance.contactNo2,
      'registration_date': instance.registrationDate,
      'last_login': instance.lastLogin,
      'role': instance.role,
      'identity_no': instance.identityNo,
    };
