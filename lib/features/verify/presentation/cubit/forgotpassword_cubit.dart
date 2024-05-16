import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgotpassword_state.dart';

class ForgotpasswordCubit extends Cubit<ForgotpasswordState> {
  ForgotpasswordCubit() : super(ForgotpasswordInitial());
}
