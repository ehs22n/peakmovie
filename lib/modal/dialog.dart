import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class AppDialog {

  static void info(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    AwesomeDialog(
      context: context,
      width: 400,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      dialogBorderRadius: BorderRadius.circular(16),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: true,

      body: _buildBody(
        context,
        icon: Icons.info_outline,
        title: title,
        message: message,
        color: Colors.blue,
      ),

      btnOkText: "باشه",
      btnOkColor: Colors.black87,
      buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),
      btnOkOnPress: () {},
    ).show();
  }

  static void error(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    AwesomeDialog(
      context: context,
      width: 340,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      dialogBorderRadius: BorderRadius.circular(16),

      body: _buildBody(
        context,
        icon: Icons.error_outline,
        title: title,
        message: message,
        color: Colors.red,
      ),

      btnOkText: "باشه",
      btnOkColor: Colors.black87,
      buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),
      btnOkOnPress: () {},
    ).show();
  }

  static void warning(
    BuildContext context, {
    required String title,
    required String message,
    VoidCallback? onConfirm,
  }) {
    AwesomeDialog(
      context: context,
      width: 340,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      dialogBorderRadius: BorderRadius.circular(16),

      body: _buildBody(
        context,
        icon: Icons.warning_amber_rounded,
        title: title,
        message: message,
        color: Colors.orange,
      ),

      btnOkText: "تأیید",
      btnCancelText: "لغو",
      btnOkColor: Colors.black87,

      buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),

      btnOkOnPress: onConfirm ?? () {},
      btnCancelOnPress: () {},
    ).show();
  }

  static Widget _buildBody(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String message,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 28,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),

        ],
      ),
    );
  }
}
