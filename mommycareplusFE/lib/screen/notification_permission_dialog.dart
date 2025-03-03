import 'package:flutter/material.dart';

class NotificationPermissionDialog extends StatelessWidget {
  const NotificationPermissionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      titlePadding: const EdgeInsets.all(20),
      contentPadding: const EdgeInsets.all(20),
      title: const Text(
        "Would you like to enable notifications for MOMMYcare+?",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      content: const Text(
        "MOMMYcare+ uses notifications to keep you updated on your self care and about your baby’s care.\n\nYou can manage your notification preferences at any time in settings.",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // User allowed notifications
            Navigator.of(context).pop(true);
          },
          child: const Text(
            "Allow",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.blue,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            // User did not allow notifications
            Navigator.of(context).pop(false);
          },
          child: const Text(
            "Don’t Allow",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
