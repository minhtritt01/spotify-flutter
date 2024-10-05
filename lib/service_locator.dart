import 'package:get_it/get_it.dart';
import './domain/usecases/auth/get_user.dart';
import './domain/usecases/song/add_or_remove_favorite_song.dart';
import './domain/usecases/song/is_favorite_song.dart';
import './domain/usecases/song/get_play_list.dart';
import './domain/usecases/song/get_new_songs.dart';
import './data/repository/song/song_repository_impl.dart';
import './domain/usecases/auth/signin.dart';
import './domain/usecases/auth/singup.dart';
import './data/sources/auth/auth_firebase_service.dart';
import './domain/repository/auth/auth.dart';

import 'data/repository/auth/auth_repository_impl.dart';
import 'data/sources/song/song_firebase_service.dart';
import 'domain/repository/song/song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //auth
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());

  //song
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  sl.registerSingleton<SongRepository>(SongRepositoryImpl());
  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
  sl.registerSingleton<GetPlayListUseCase>(GetPlayListUseCase());
  sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
      AddOrRemoveFavoriteSongUseCase());
  sl.registerSingleton<IsFavoriteSongUseCase>(IsFavoriteSongUseCase());
}
