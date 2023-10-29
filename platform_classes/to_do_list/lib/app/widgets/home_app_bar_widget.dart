import 'package:flutter/material.dart';

typedef TapDateCallback = void Function(DateTime);

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({
    super.key,
    required this.onNextTap,
    required this.onPreviousTap,
    required this.title,
    required this.onTitleTap,
  });

  final Widget title;
  final TapDateCallback onTitleTap;
  final void Function() onNextTap;
  final VoidCallback onPreviousTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_rounded),
            onPressed: onPreviousTap,
          ),
          GestureDetector(
            onTap: () {
              onTitleTap(DateTime.now());
            },
            child: title,
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_right_rounded),
            onPressed: onNextTap,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
