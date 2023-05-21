
import 'package:flutter/cupertino.dart';

import '../../../../../../core/widgets/text_field.dart';
import '../../../../../../core/widgets/title_form_text.dart';

class Datafield extends StatelessWidget{
  const Datafield ({super.key, this.text, this.label, this.inputType});
  final String? label;
  final String? text;
  final TextInputType? inputType;



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          label: label,
        ),
        const SizedBox(height: 5,),
        CustomTextFormField(
          inputType: inputType,
          text: text,
        )

      ],
    );
  }

}

