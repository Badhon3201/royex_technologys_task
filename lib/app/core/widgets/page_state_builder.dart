import 'package:flutter/material.dart';
import 'package:royex_technologys_task/app/core/utils/failure/app_error.dart';
import 'package:royex_technologys_task/app/core/values/string_resources.dart';
import 'package:royex_technologys_task/app/core/widgets/failure_full_screen_widget.dart';

class PageStateBuilder extends StatelessWidget {
  final AppError appError;
  final Widget child;
  final bool showLoader;
  final bool showError;
  final Future Function()? onRefresh;

  const PageStateBuilder({super.key,
    this.showError = false,
    required this.appError,
    required this.child,
    this.onRefresh,
    this.showLoader = false,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          if (onRefresh != null) {
            return onRefresh!();
          } else {
            return;
          }
        },
        child: Container(
          child: showError
              ? ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [_errorWidget(context)],
                )
              : child,
        ));
  }

  Widget _errorWidget(BuildContext context) {
    switch (appError) {
      case AppError.serverError:
        return FailureFullScreenWidget(
          errorMessage: StringResources.unableToLoadData,
          onTap: onRefresh,
        );

      case AppError.networkError:
        return FailureFullScreenWidget(
          errorMessage: StringResources.couldNotReachServer,
          onTap: onRefresh,
        );

      default:
        return FailureFullScreenWidget(
          errorMessage: StringResources.somethingIsWrong,
          onTap: onRefresh,
        );
    }
  }
}
