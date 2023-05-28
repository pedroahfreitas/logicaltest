import 'package:flutter/material.dart';
//import 'package:maths/cadastro.dart';

enum ViewDialogsAction { yes, no }

class ViewDialogs {
  static Future<ViewDialogsAction> yesOrNoDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(ViewDialogsAction.no),
              child: const Text('NÃO'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(ViewDialogsAction.yes),
              child: const Text(
                'SIM',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : ViewDialogsAction.no;
  }
}
