import 'package:flutter/material.dart';
import 'package:royex_technologys_task/app/core/utils/common_space.dart';
import 'package:royex_technologys_task/app/core/values/color_manager.dart';
import 'package:royex_technologys_task/app/core/widgets/TextWidget.dart';

import 'package:royex_technologys_task/app/data/models/labels_response_model.dart';

class LabelSelectedCardWidget extends StatelessWidget {
  const LabelSelectedCardWidget(
      {super.key, required this.labels, required this.onTap});

  final LabelsResponseModel labels;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CommonSpace.padding8,
      margin: CommonSpace.padding8,
      decoration: BoxDecoration(
        color: ColorManager.greenColor,
        borderRadius: CommonSpace.radius20,
      ),
      child: Wrap(
        children: [
          CustomTextWidget(
            text: labels.name ?? '',
            textColor: ColorManager.whiteColor,
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              margin: CommonSpace.paddingLeft,
              decoration: BoxDecoration(
                color: ColorManager.redColor,
                borderRadius: CommonSpace.radius20,
              ),
              child: Icon(
                Icons.clear,
                color: ColorManager.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
