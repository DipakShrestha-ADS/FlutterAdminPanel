import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';
import 'package:weplay_admin/view/viewUtils/themes.dart';

class CustomIconButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onPressed;
  final Color backColor;
  CustomIconButton({
    @required this.title,
    @required this.icon,
    @required this.onPressed,
    this.backColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = RepositoryProvider.of<AppTheme>(context);
    return FlatButton.icon(
      onPressed: onPressed,
      label: Text(
        title,
        style: TextStyles.Btn.copyWith(
          color: theme.surface,
        ),
      ),
      color: backColor ?? theme.accent1Darker,
      icon: Icon(
        icon,
        color: theme.surface,
      ),
    );
  }
}
