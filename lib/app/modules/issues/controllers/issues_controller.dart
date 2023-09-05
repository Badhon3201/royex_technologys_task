import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:royex_technologys_task/app/core/utils/failure/app_error.dart';
import 'package:royex_technologys_task/app/data/models/issues_response_model.dart';
import 'package:royex_technologys_task/app/data/models/labels_response_model.dart';
import 'package:royex_technologys_task/app/modules/issues/repositories/issues_repositoriy.dart';

class IssuesController extends GetxController {
  IssuesRepository issuesRepository = IssuesRepository();
  AppError _appError = AppError.none;
  final _labelsList = RxList<LabelsResponseModel>();
  final _selectedLabelsList = RxList<LabelsResponseModel>();
  final _issuesList = RxList<IssuesResponseModel>();
  final _issuesMoreList = RxList<IssuesResponseModel>();
  final _isLoading = false.obs;
  final _isMoreLoading = false.obs;
  final _isMoreLoadingEnable = true.obs;
  final currentPage = 1.obs;
  final listLength = 0.obs;
  final scrollController = ScrollController();
  Rxn<LabelsResponseModel> selectedLabelItem = Rxn<LabelsResponseModel>();
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    initialLoad();
  }

  Future<void> initialLoad() async {
    await getIssuesListData();
    await getLabelsListData();
    await getScrollListenerData();
  }

  Future<void> getLabelsListData() async {
    _isLoading.value = true;
    final response =
        await issuesRepository.fetchLabelsList(searchController.text);
    _isLoading.value = false;
    response.fold((l) {
      _appError = l;
    }, (r) {
      _labelsList.value = r;
    });
  }

  Future<void> getIssuesListData() async {
    _isLoading.value = true;
    final response = await issuesRepository.fetchIssuesList(
      labels: selectedLabelItem.value?.name,
    );
    _isLoading.value = false;
    response.fold((l) {
      _appError = l;
    }, (r) {
      _issuesList.value = r;
      listLength.value = r.length;
      currentPage.value++;
    });
  }

  Future<void> getMoreIssuesListData() async {
    _isMoreLoading.value = true;
    final response = await issuesRepository.fetchIssuesList(
      page: currentPage.value,
      labels: selectedLabelItem.value?.name,
    );
    _isMoreLoading.value = false;
    _isMoreLoadingEnable.value = false;
    response.fold((l) {
      _appError = l;
    }, (r) {
      _issuesMoreList.value = r;
      _issuesList.addAll(r);
      currentPage.value++;
    });
  }

  Future<void> getScrollListenerData() async {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (_isMoreLoadingEnable.value) {
          await getMoreIssuesListData();
        } else if (_issuesMoreList.length == listLength.value &&
            _isMoreLoadingEnable.isFalse) {
          await getMoreIssuesListData();
        }
      }
    });
  }

  RxList<LabelsResponseModel> get labelsList => _labelsList;
  RxList<LabelsResponseModel> get selectedLabelsList => _selectedLabelsList;
  List<IssuesResponseModel> get issuesList => _issuesList;
  AppError get appError => _appError;
  RxBool get isLoading => _isLoading;
  RxBool get isMoreLoading => _isMoreLoading;
  RxList<bool> isIssueExpanded = <bool>[].obs;
}
