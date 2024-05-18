import 'package:bloc/bloc.dart';
import 'package:chdtask/features/user/domain/entities/profile_entity.dart';
import 'package:chdtask/features/user/domain/usecases/profile_usecase.dart';
import 'package:chdtask/features/user/presentation/manager/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase profileUseCase;
  ProfileEntity? profileEntity;
  ProfileCubit({required this.profileUseCase})
      : super(const ProfileState.initial());

  Future<void> getProfile() async {
    emit(const ProfileState.loading());
    var data = await profileUseCase.getProfile();
    data.when(
        data: (data) {
          profileEntity = data;
          emit(ProfileState.success(profileEntity: data));
        },
        error: (errorHandler) => emit(
            ProfileState.failure(error: errorHandler.apiErrorModel.message!)));
  }
}
