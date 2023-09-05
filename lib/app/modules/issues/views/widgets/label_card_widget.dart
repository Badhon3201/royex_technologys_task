import 'package:flutter/material.dart';
import 'package:royex_technologys_task/app/core/utils/common_space.dart';
import 'package:royex_technologys_task/app/core/values/color_manager.dart';
import 'package:royex_technologys_task/app/core/widgets/TextWidget.dart';

import 'package:royex_technologys_task/app/data/models/labels_response_model.dart';

class LabelCardWidget extends StatelessWidget {
  const LabelCardWidget({super.key, required this.labels});

  final LabelsResponseModel labels;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CommonSpace.padding8,
      margin: CommonSpace.padding8,
      decoration: BoxDecoration(
        color: Color(int.parse('0xFF${labels.color}')),
        borderRadius: CommonSpace.radius20,
      ),
      child: CustomTextWidget(
        text: labels.name ?? '',
        textColor: ColorManager.whiteColor,
      ),
    );
  }
}
