class ProfileEntity {
  DataEntity? data;
  String? message;

  ProfileEntity({this.data, this.message});
}

class DataEntity {
  String? avatar;
  int? accountNr;
  String? name;
  String? firstName;
  String? lastName;
  int? dialCode;
  String? iso2;
  String? iso3;
  int? phone;
  String? type;
  String? lastLoginAt;
  int? loginCount;
  String? defaultLang;
  List<AccountsEntity>? accounts;
  List<ContextsEntity>? contexts;

  DataEntity(
      {this.avatar,
      this.accountNr,
      this.name,
      this.firstName,
      this.lastName,
      this.dialCode,
      this.iso2,
      this.iso3,
      this.phone,
      this.type,
      this.lastLoginAt,
      this.loginCount,
      this.defaultLang,
      this.accounts,
      this.contexts});
}

class AccountsEntity{
  String? avatar;
  int? accountNr;
  String? name;
  bool? active;
  String? type;

  AccountsEntity({this.avatar, this.accountNr, this.name, this.active, this.type});
}

class ContextsEntity {
  String? id;
  String? name;
  ConfigEntity? config;

  ContextsEntity({this.id, this.name, this.config});
}

class ConfigEntity {
  String? guard;
  String? endPoint;

  ConfigEntity({this.guard,  this.endPoint});
}
