import 'package:flutter/material.dart';
import 'package:hurdl_chat/common/theme/color.dart';

void hideOpenDialog({
  required BuildContext context,
}) async {
  Navigator.of(context).pop();
}

void showLoadingIndicator(
    {required BuildContext context, bool isDark = false}) {
  showDialog(
    barrierDismissible: true,
    useRootNavigator: false,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 2 - 35,
          vertical: 25,
        ),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          insetPadding: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.textfieldColor,
            ),
            height: 70,
            width: 60,
            child: const Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 47,
                  width: 47,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
