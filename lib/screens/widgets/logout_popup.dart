import 'package:flutter/material.dart';

class LogoutPopup extends StatelessWidget {
  final void Function()? onConfirm;

  const LogoutPopup({Key? key, this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to log out?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (onConfirm != null) {
              onConfirm!();
            }
            Navigator.of(context).pop();
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
