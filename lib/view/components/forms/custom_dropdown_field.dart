import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomDropDownField extends StatelessWidget {
  CustomDropDownField({
    Key key,
    @required this.attribute,
    @required this.labelText,
    this.hintText,
    this.initialValue,
    @required this.itemList,
    this.onItemTap,
    this.dropDownColor,
    this.autoFocus = false,
    this.readOnly = false,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.transformer,
  });
  final String attribute;
  final String labelText;
  final String hintText;
  final bool readOnly;
  final String initialValue;
  final List<String> itemList;
  final Function() onItemTap;
  final Color dropDownColor;
  final bool autoFocus;
  final FocusNode focusNode;
  final Function(dynamic) onChanged;
  final dynamic Function(dynamic) transformer;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: FormBuilderDropdown(
        attribute: attribute,
        autofocus: autoFocus,
        focusNode: focusNode,
        allowClear: true,
        onChanged: onChanged,
        onTap: onTap,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: labelText,
        ),
        hint: hintText == null ? null : Text(hintText),
        initialValue: initialValue ?? null,
        validators: [
          FormBuilderValidators.required(),
        ],
        valueTransformer: transformer,
        dropdownColor: dropDownColor,
        items: itemList
            .map(
              (val) => DropdownMenuItem(
                value: val,
                onTap: onItemTap,
                child: Text("$val"),
              ),
            )
            .toList(),
      ),
    );
  }
}
