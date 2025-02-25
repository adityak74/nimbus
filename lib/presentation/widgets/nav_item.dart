import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/selected_indicator.dart';
import 'package:nimbus/values/values.dart';

import 'empty.dart';

class NavItemData {
  final String name;
  final GlobalKey key;
  bool isSelected;

  NavItemData({
    required this.name,
    required this.key,
    this.isSelected = false,
  });
}

class NavItem extends StatelessWidget {
  NavItem({
    required this.title,
    this.titleColor = AppColors.black,
    this.isSelected = false,
    this.titleStyle,
    this.onTap,
  });

  final String title;
  final TextStyle? titleStyle;
  final Color titleColor;
  final bool isSelected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          isSelected
              ? Positioned(
                  top: Sizes.SIZE_12,
                  child: SelectedIndicator(),
                )
              : Empty(),
          Text(
            title,
            style: titleStyle ??
                textTheme.subtitle1?.copyWith(
                  fontSize: Sizes.TEXT_SIZE_16,
                  color: titleColor,
                ),
          ),
        ],
      ),
    );
  }
}
