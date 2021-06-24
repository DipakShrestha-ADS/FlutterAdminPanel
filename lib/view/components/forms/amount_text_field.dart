import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';

class AmountTextField extends StatelessWidget {
  AmountTextField({
    Key key,
    @required this.labelText,
    this.initialValue,
    this.autoFocus = false,
    this.focusNode,
    this.onSubmit,
    this.onTap,
  }) : super(key: key);
  final String labelText;
  final TextEditingController controller = TextEditingController();
  final String initialValue;
  final bool autoFocus;
  final FocusNode focusNode;
  final Function(String) onSubmit;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    controller.text = initialValue ?? null;
    return FormBuilderTextField(
      attribute: "amount",
      controller: controller,
      autofocus: autoFocus,
      focusNode: focusNode,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      style: TextStyles.Footnote.copyWith(
        fontSize: FontSizes.s16,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      valueTransformer: (value) {
        if (value.isNotEmpty) {
          return int.parse(value);
        }
        return value;
      },
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.numeric(),
      ],
    );
  }
}
