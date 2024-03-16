import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee {
  @JsonKey(name: 'employee_id')
  int? employeeId;
  @JsonKey(name: 'employee_name')
  String? employeeName;
  @JsonKey(name: 'contact_no1')
  String? contactNo1;
  @JsonKey(name: 'manager_id')
  int? managerId;
  bool? isActive;
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'auth_id')
  int? authId;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'user_name')
  String? userName;
  String? role;
  late String? isEmployeeActive;

  Employee({
    this.employeeId,
    this.employeeName,
    this.contactNo1,
    this.managerId,
    this.isActive,
    this.fullName,
    this.authId,
    this.userId,
    this.userName,
    this.role,
  }){
    isEmployeeActive = isActive == true ? 'Active' : 'Inactive';
  }

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
