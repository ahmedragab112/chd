import 'package:chdtask/features/user/data/models/profile_data_model.dart';

abstract class ProfileDataSource {
  Future<ProfileDataModel> getProfile();
}
