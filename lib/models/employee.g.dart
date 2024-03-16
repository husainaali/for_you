// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      employeeId: json['employee_id'] as int?,
      employeeName: json['employee_name'] as String?,
      contactNo1: json['contact_no1'] as String?,
      managerId: json['manager_id'] as int?,
      isActive: json['isActive'] as bool?,
      fullName: json['full_name'] as String?,
      authId: json['auth_id'] as int?,
      userId: json['user_id'] as int?,
      userName: json['user_name'] as String?,
      role: json['role'] as String?,
    )..isEmployeeActive = json['isEmployeeActive'] as String?;

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'employee_id': instance.employeeId,
      'employee_name': instance.employeeName,
      'contact_no1': instance.contactNo1,
      'manager_id': instance.managerId,
      'isActive': instance.isActive,
      'full_name': instance.fullName,
      'auth_id': instance.authId,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'role': instance.role,
      'isEmployeeActive': instance.isEmployeeActive,
    };
