import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/home/pages/widgets/new_songs.dart';
import '../../../common/widgets/appbar/basic_app_bar.dart';
import '../../../gen/assets.gen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: Assets.vectors.spotifyLogo.svg(height: 40.0, width: 40.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabs([
              'News',
              'Videos',
              'Artists',
              'Podcasts',
            ]),
            Container(
              height: 260.0,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TabBarView(controller: _tabController, children: [
                const NewSongs(),
                Container(),
                Container(),
                Container()
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 140.0,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Assets.vectors.homeTopCard.svg()),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 60.0),
                  child: Assets.images.homeArtist.image(),
                ))
          ],
        ),
      ),
    );
  }

  Widget _tabs(List<String> tabContents) {
    return TabBar(
        indicatorColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 12.0),
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        isScrollable: true,
        controller: _tabController,
        tabs: [
          ...tabContents.map((e) => Text(
                e,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 16.0),
              ))
        ]);
  }
}
