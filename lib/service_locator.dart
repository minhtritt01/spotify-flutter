import 'package:get_it/get_it.dart';
import '../domain/usecases/auth/signin.dart';
import '../domain/usecases/auth/singup.dart';
import './data/sources/auth/auth_firebase_service.dart';
import './domain/repository/auth/auth.dart';

import 'data/repository/auth/auth_repository_impl.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
