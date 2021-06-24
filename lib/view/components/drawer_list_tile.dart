import 'package:flutter/material.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';

class DrawerListTile extends StatelessWidget {
  final bool isResize;
  final Function() onTap;
  final IconData iconData;
  final String iconText;
  final String title;
  final bool isSelected;
  final bool isDense;
  DrawerListTile({
    Key key,
    @required this.isResize,
    @required this.onTap,
    this.iconData,
    this.iconText,
    @required this.title,
    this.isSelected,
    this.isDense = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Tooltip(
        message: '$title',
        child: ListTile(
          dense: isDense,
          leading: iconText != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 11,
                      backgroundColor: Colors.blueGrey,
                      child: Text(
                        '$iconText',
                        style: TextStyles.Btn.copyWith(
                          color: Colors.white,
                          fontSize: FontSizes.s12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              : Icon(iconData),
          selected: isSelected ?? false,
          title: isResize
              ? Container(
                  width: 0,
                  height: 0,
                )
              : Text(
                  '$title',
                  style: TextStyles.T1.copyWith(
                    fontSize: FontSizes.s16,
                  ),
                ),
          onTap: onTap,
        ),
      ),
    );
  }
}
