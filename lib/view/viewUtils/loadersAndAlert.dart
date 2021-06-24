import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';

class LoadersAndAlert {
  void showLoaders() {
    BotToast.showLoading(
      backgroundColor: Colors.transparent,
      allowClick: true,
    );
  }

  void showAlertNotification({
    @required Color leadingIconColor,
    @required IconData leadingIcon,
    @required Color titleColor,
    @required String title,
    @required Color trailingIconColor,
    @required IconData trailingicon,
    Color backgroundColor,
    Widget subTitle,
    Function() onTap,
    Function() onClose,
    Function() onLongPress,
    bool onlyOne,
    Alignment align,
    Duration duration,
    Widget titleWidget,
  }) {
    BotToast.showNotification(
        duration: duration ?? Duration(seconds: 2),
        leading: (widget) {
          return Icon(
            Icons.save,
            color: leadingIconColor,
          );
        },
        title: (widget) {
          return titleWidget ??
              Text(
                '$title',
                style: TextStyles.CalloutFocus.copyWith(
                  color: titleColor,
                ),
                overflow: TextOverflow.ellipsis,
              );
        },
        backgroundColor: backgroundColor ?? Colors.white,
        onTap: onTap ?? null,
        onClose: onClose ?? null,
        onLongPress: onLongPress ?? null,
        subtitle: (w) {
          return subTitle ?? null;
        },
        align: align ?? Alignment.topCenter,
        onlyOne: onlyOne ?? true,
        trailing: (w) {
          return IconButton(
            icon: Icon(
              trailingicon,
              color: trailingIconColor,
            ),
            onPressed: () {
              BotToast.cleanAll();
            },
          );
        });
  }
}
