import 'package:chdtask/features/user/domain/entities/profile_entity.dart';

class ProfileDataModel extends ProfileEntity {
  int? status;

  ProfileDataModel({super.data, super.message, this.status});

  ProfileDataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }
}

class Data extends DataEntity {
  Null middleName;

  Null email;

  Null dob;

  Data(
      {super.avatar,
      super.accountNr,
      super.name,
      super.firstName,
      this.middleName,
      super.lastName,
      this.email,
      super.dialCode,
      super.iso2,
      super.iso3,
      super.phone,
      this.dob,
      super.type,
      super.lastLoginAt,
      super.loginCount,
      super.defaultLang,
      super.accounts,
      super.contexts});

  Data.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    accountNr = json['account_nr'];
    name = json['name'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    email = json['email'];
    dialCode = json['dial_code'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    phone = json['phone'];
    dob = json['dob'];
    type = json['type'];

    lastLoginAt = json['last_login_at'];
    loginCount = json['login_count'];
    defaultLang = json['default_lang'];
    if (json['accounts'] != null) {
      accounts = <Accounts>[];
      json['accounts'].forEach((v) {
        accounts!.add(Accounts.fromJson(v));
      });
    }
    if (json['contexts'] != null) {
      contexts = <Contexts>[];
      json['contexts'].forEach((v) {
        contexts!.add(Contexts.fromJson(v));
      });
    }
  }
}

class Accounts extends AccountsEntity {
  Accounts(
      {super.avatar, super.accountNr, super.name, super.active, super.type});

  Accounts.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    accountNr = json['account_nr'];
    name = json['name'];
    active = json['active'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar'] = avatar;
    data['account_nr'] = accountNr;
    data['name'] = name;
    data['active'] = active;
    data['type'] = type;
    return data;
  }
}

class Contexts extends ContextsEntity {
  Contexts({super.id, super.name, super.config});

  Contexts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    config = json['config'] != null ? Config.fromJson(json['config']) : null;
  }
}

class Config extends ConfigEntity {
  String? version;

  Config({super.guard, this.version, super.endPoint});

  Config.fromJson(Map<String, dynamic> json) {
    guard = json['guard'];
    version = json['version'];
    endPoint = json['end_point'];
  }
}
