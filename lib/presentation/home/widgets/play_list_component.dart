import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/presentation/home/cubit/play_list_cubit.dart';

import 'play_list.dart';

class PlayListComponent extends StatelessWidget {
  const PlayListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayListCubit()..getPlayList(),
      child: BlocBuilder<PlayListCubit, PlayListState>(
        builder: (context, state) {
          if (state is PlayListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PlayListLoaded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Playlist',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text('See More',
                          style: TextStyle(
                              color: context.isDarkMode
                                  ? const Color(0xffc6c6c6)
                                  : Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                  const Gap(20.0),
                  PlayList(
                    songs: state.songs,
                  )
                ],
              ),
            );
          }
          if (state is PlayListLoadFailure) {
            return const Center(
              child: Text('Error'),
            );
          }
          return const Center(
            child: Text('None'),
          );
        },
      ),
    );
  }
}
