import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:weplay_admin/view/viewUtils/themes.dart';

class SlidableEditDelete extends StatelessWidget {
  SlidableEditDelete({
    Key key,
    @required this.child,
    this.actionExtentRatio,
    this.actions,
    this.secondaryActions,
    this.editOnPressed,
    this.deleteOnPressed,
  }) : super(key: key);

  final Widget child;
  final double actionExtentRatio;
  final List<Widget> actions;
  final List<Widget> secondaryActions;
  final Function() editOnPressed;
  final Function() deleteOnPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: actionExtentRatio ?? 0.25,
      child: child,
      actions: actions ??
          (secondaryActions != null
              ? null
              : <Widget>[
                  IconSlideAction(
                    caption: 'Edit',
                    color: theme.accent1Darker,
                    icon: Icons.edit,
                    onTap: editOnPressed,
                  ),
                  IconSlideAction(
                    caption: 'Delete',
                    color: theme.error,
                    icon: Icons.delete,
                    onTap: deleteOnPressed,
                  ),
                ]),
      secondaryActions: secondaryActions ?? null,
    );
  }
}
