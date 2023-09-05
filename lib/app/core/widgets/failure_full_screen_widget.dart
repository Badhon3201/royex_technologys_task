import 'package:flutter/material.dart';
import 'package:royex_technologys_task/app/core/utils/styles.dart';

class FailureFullScreenWidget extends StatelessWidget {
  const FailureFullScreenWidget({
    super.key,
    required this.errorMessage,
    this.onTap,
  });

  final String errorMessage;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: MediaQuery.of(context).size.height -
              (AppBar().preferredSize.height * 2.5) -
              80,
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: TextStyles.grayBoldStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
