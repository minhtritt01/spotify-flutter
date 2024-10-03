import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool hideBack;
  const BasicAppbar({super.key, this.title, this.hideBack=false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: title,
      centerTitle: true,
      leading:hideBack?null: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
                color: context.isDarkMode
                    ? Colors.white.withOpacity(.03)
                    : Colors.black.withOpacity(.04),
                shape: BoxShape.circle),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15.0,
              color: context.isDarkMode ? Colors.white : Colors.black,
            ),
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
