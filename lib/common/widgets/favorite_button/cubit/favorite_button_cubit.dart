import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/usecases/song/add_or_remove_favorite_song.dart';
import '../../../../service_locator.dart';

part 'favorite_button_state.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());
  Future<void> favoriteButtonUpdated(String songId) async {
    var result =
        await sl<AddOrRemoveFavoriteSongUseCase>().call(params: songId);

    result.fold((error) {}, (data) {
      emit(FavoriteButtonUpdated(isFavorite: data));
    });
  }
}
