import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/widgets/favorite_button/cubit/favorite_button_cubit.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

import '../../../../domain/entities/song/song.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.song, this.function});
  final SongEntity song;
  final void Function()? function;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if (state is FavoriteButtonInitial) {
            return IconButton(
              iconSize: 25.0,
              onPressed: () async {
                context
                    .read<FavoriteButtonCubit>()
                    .favoriteButtonUpdated(song.songId);
                if (function != null) {
                  function?.call();
                }
              },
              icon: Icon(song.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_outline_outlined),
              color: AppColors.darkGrey,
            );
          }
          if (state is FavoriteButtonUpdated) {
            return IconButton(
              iconSize: 25.0,
              onPressed: () {
                context
                    .read<FavoriteButtonCubit>()
                    .favoriteButtonUpdated(song.songId);
              },
              icon: Icon(state.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_outline_outlined),
              color: AppColors.darkGrey,
            );
          }
          return Container();
        },
      ),
    );
  }
}
