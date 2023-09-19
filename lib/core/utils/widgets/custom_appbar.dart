import 'package:flutter/material.dart';
import '../constants.dart';



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double appBarHeight; // Specify the desired height of the app bar
  final IconData? leadingIcon; // Specify the leading icon (optional)
  final IconData? actionIcons;
  final VoidCallback? onPressedLeadIcon;
  final VoidCallback? onPressedActionIcon;

  const CustomAppBar({
    Key? key,
    required this.appBarHeight,
    required this.leadingIcon,
    required this.actionIcons,
    this.onPressedActionIcon,
    this.onPressedLeadIcon,
    this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.appColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(appBarHeight / 5), // Divide by 5 for a circular radius
          bottomRight: Radius.circular(appBarHeight / 5),
        ),
      ),
      leading: (leadingIcon != null)
          ? IconButton(
              icon: Icon(leadingIcon, color: AppColors.whiteColor, size: 24),
              onPressed: onPressedLeadIcon,
            )
          : null,
      title: Text(
        title!,
        style: textStyle04,
      ),
      actions: (actionIcons != null)
          ? [
              Padding(
                padding: const EdgeInsets.only(right:10.0),
                child: IconButton(
                  icon: Icon(actionIcons, color: AppColors.whiteColor, size: 24),
                  onPressed: onPressedActionIcon,
                ),
              ),
            ]
          : null,
    );
  }
}