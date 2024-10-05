import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/basic_app_bar.dart';
import 'package:spotify/presentation/profile/cubit/profile_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        backgroundColor:
            context.isDarkMode ? const Color(0xff2c2b2b) : Colors.white,
        title: const Text('Profile'),
      ),
      body: Column(
        children: [_profileInfo(context)],
      ),
    );
  }

  Widget _profileInfo(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUser(),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height / 3.5,
        decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(50.0)),
            color: context.isDarkMode ? const Color(0xff2c2b2b) : Colors.white),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProfileLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 90.0,
                    width: 90.0,
                    child: CircleAvatar(
                      child: Image.network(
                        state.userEntity.imgURL!,
                      ),
                    ),
                  ),
                  const Gap(15.0),
                  Text(state.userEntity.email!),
                  const Gap(10.0),
                  Text(
                    state.userEntity.fullName!,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  )
                ],
              );
            }
            if (state is ProfileLoadFailure) {
              return const Center(
                child: Text('An error occurred'),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
