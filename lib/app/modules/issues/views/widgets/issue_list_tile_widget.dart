import 'package:flutter/material.dart';
import 'package:royex_technologys_task/app/core/utils/common_space.dart';
import 'package:royex_technologys_task/app/core/utils/date_time_helper.dart';
import 'package:royex_technologys_task/app/core/utils/styles.dart';
import 'package:royex_technologys_task/app/core/values/color_manager.dart';
import 'package:royex_technologys_task/app/core/widgets/TextWidget.dart';
import 'package:royex_technologys_task/app/data/models/issues_response_model.dart';
import 'package:royex_technologys_task/app/modules/issues/views/widgets/label_card_widget.dart';

class IssueListTile extends StatelessWidget {
  const IssueListTile({super.key, required this.issueItem, this.isExpanded});

  final IssuesResponseModel issueItem;
  final bool? isExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: CommonSpace.cardPadding,
      padding: CommonSpace.commonPagePadding,
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        boxShadow: [
          BoxShadow(
            color: ColorManager.blackColor.withOpacity(0.1),
            blurRadius: 1,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _contentsSection(),
          CommonSpace.sizedBoxH10,
          _labelsSection(),
          CommonSpace.sizedBoxH10,
        ],
      ),
    );
  }

  Widget _contentsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: issueItem.title ?? '',
                textStyle: TextStyles.titleStyle,
              ),
              CommonSpace.sizedBoxH10,
              CustomTextWidget(
                text:
                    isExpanded == true ? 'Body: \n${issueItem.body ?? ""}' : '',
                textStyle: TextStyles.grayBoldStyle,
              ),
            ],
          ),
        ),
        CommonSpace.sizedBoxW10,
        Column(
          children: [
            CustomTextWidget(
              text:
                  DateTimeHelper.getDateByFormatter(issueItem.createdAt!) ?? '',
              textStyle: TextStyles.text16Style,
            ),
            CustomTextWidget(
              text: issueItem.user?.login ?? '',
              textStyle: TextStyles.grayBoldStyle,
            ),
            Icon(
              isExpanded == true
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
              color: isExpanded == true
                  ? ColorManager.greenColor
                  : ColorManager.grayColor,
            ),
          ],
        )
      ],
    );
  }

  Widget _labelsSection() {
    return Wrap(
      children: [
        for (var item in issueItem.labels!) LabelCardWidget(labels: item),
      ],
    );
  }
}
