import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_tasker/views/components/widgets.dart';
import 'package:team_tasker/views/constants/constants.dart';

class GlobalMethods {
  // Error Handler

  Future<void> AuthError(String subtitle, BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Error Occured !',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: kSecondaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: Image.asset(
                    'assets/images/error.gif',
                    height: 50.h,
                    width: 50.w,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25.h,
                ),
              ],
            ),
            actions: [
              Mybtn(
                title: 'Ok',
                onTap: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  // Success

  Future<void> success(
      String subtitle, String title, BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: kSecondaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 6.w),
                child: Image.asset(
                  'assets/images/done.gif',
                  height: 50.h,
                  width: 50.w,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25.h,
              ),
            ],
          ),
          actions: [
            Mybtn(
              title: 'Ok',
              onTap: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }

  // TOp Nav Bar

  AppBar TopNavBar( String title) {
    return AppBar(
      backgroundColor: kSecondaryColor,
      title: Text(
        title,
        style: TextStyle(
            color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: kWhiteColor),
    );
  }


  // Bottom Navigation

  
}
