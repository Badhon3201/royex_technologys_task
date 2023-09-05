import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royex_technologys_task/app/core/utils/common_space.dart';
import 'package:royex_technologys_task/app/core/utils/styles.dart';
import 'package:royex_technologys_task/app/core/values/color_manager.dart';
import 'package:royex_technologys_task/app/core/values/string_resources.dart';
import 'package:royex_technologys_task/app/core/widgets/page_state_builder.dart';
import 'package:royex_technologys_task/app/modules/issues/controllers/issues_controller.dart';
import 'package:royex_technologys_task/app/modules/issues/views/widgets/filters_widget.dart';
import 'package:royex_technologys_task/app/modules/issues/views/widgets/issue_list_tile_widget.dart';

class IssuesView extends GetView<IssuesController> {
  const IssuesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _bodySection(),
    );
  }

  Widget _bodySection() {
    return Padding(
      padding: CommonSpace.commonPagePadding,
      child: Obx(() {
        return controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : PageStateBuilder(
                appError: controller.appError,
                child: Column(
                  children: [
                    CommonSpace.sizedBoxH5,
                    _filterSection(),
                    CommonSpace.sizedBoxH10,
                    _listSection(),
                    CommonSpace.sizedBoxH10,
                    _moreLoading(),
                  ],
                ),
              );
      }),
    );
  }

  PreferredSizeWidget _appbar() {
    return AppBar(
      backgroundColor: ColorManager.whiteColor,
      centerTitle: true,
      elevation: 0,
      title: Text(
        StringResources.title,
        style: TextStyles.grayBoldStyle,
      ),
    );
  }

  Widget _filterSection() {
    return FiltersWidget(
      labelList: controller.labelsList,
    );
  }

  Widget _listSection() {
    return Expanded(
      child: ListView.builder(
        controller: controller.scrollController,
        primary: false,
        shrinkWrap: true,
        itemCount: controller.issuesList.length,
        itemBuilder: (context, index) {
          controller.isIssueExpanded.add(false);
          return InkWell(
            onTap: () {
              controller.isIssueExpanded[index] =
                  !controller.isIssueExpanded[index];
            },
            child: Obx(() {
              return IssueListTile(
                issueItem: controller.issuesList[index],
                isExpanded: controller.isIssueExpanded[index],
              );
            }),
          );
        },
      ),
    );
  }

  Widget _moreLoading() {
    return controller.isMoreLoading.value
        ? const Center(child: CircularProgressIndicator())
        : const SizedBox();
  }
}
