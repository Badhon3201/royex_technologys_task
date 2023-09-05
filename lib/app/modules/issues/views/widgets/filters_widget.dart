import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royex_technologys_task/app/core/utils/reponsive_ui_service.dart';
import 'package:royex_technologys_task/app/core/utils/styles.dart';
import 'package:royex_technologys_task/app/core/values/color_manager.dart';
import 'package:royex_technologys_task/app/core/values/string_resources.dart';
import 'package:royex_technologys_task/app/data/models/labels_response_model.dart';
import 'package:royex_technologys_task/app/modules/issues/controllers/issues_controller.dart';

import 'label_selected_card_widget.dart';

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({super.key, required this.labelList});

  final List<LabelsResponseModel> labelList;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<IssuesController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownSearch<LabelsResponseModel>(
          selectedItem: controller.selectedLabelItem.value,
          items: controller.labelsList,
          itemAsString: (LabelsResponseModel? d) => d?.name ?? '',
          popupProps: PopupProps.menu(
            showSearchBox: true,
            searchFieldProps: TextFieldProps(
              controller: controller.searchController,
              onTap: controller.getLabelsListData,
            ),
            disabledItemFn: (LabelsResponseModel s) =>
                controller.labelsList.isEmpty,
          ),
          onChanged: (LabelsResponseModel? d) async {
            controller.selectedLabelItem.value = d;
            controller.selectedLabelsList.add(d!);
            await controller.getIssuesListData();
          },
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: StringResources.search,
              floatingLabelStyle: TextStyles.hintStyle,
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.r, horizontal: 18.r),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.r),
                borderSide: BorderSide(
                  color: ColorManager.grayLightColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.r),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
        Obx(() {
          return Wrap(
            children: [
              for (var item in controller.selectedLabelsList)
                LabelSelectedCardWidget(
                    labels: item,
                    onTap: () async {
                      controller.selectedLabelItem.value = null;
                      controller.selectedLabelsList.remove(item);
                      await controller.getIssuesListData();
                    }),
            ],
          );
        }),
      ],
    );
  }
}
