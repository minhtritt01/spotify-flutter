part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoadFailure extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final UserEntity userEntity;

  ProfileLoaded({required this.userEntity});
}
