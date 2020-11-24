import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static String BASE_URL = "http://abroruz98.000webhostapp.com/man_clothes";

  static void dialogMessage(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          content: Container(
            width: 239.0,
            height: 64.0,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
