import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify/domain/entities/auth/user.dart';
import 'package:spotify/domain/usecases/auth/get_user.dart';
import 'package:spotify/service_locator.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileLoading());
  Future<void> getUser() async {
    var user = await sl<GetUserUseCase>().call();
    user.fold((error) {
      emit(ProfileLoadFailure());
    }, (user) {
      emit(ProfileLoaded(userEntity: user));
    });
  }
}
