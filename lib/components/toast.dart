import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin Toast{


  void showCustom(BuildContext context,String backgroundColor,String textofToast) {
    final text =textofToast ;
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: backgroundColor == "green"
                              ? Colors.green
                              : backgroundColor == "red"
                                  ? Colors.red
                                  :  Colors.yellow,
      ),
      child:  Row(
        mainAxisSize: MainAxisSize.max,
        children: [
           if(backgroundColor =="green") const Icon(
            Icons.check,
            color: Colors.white,
          ),
           if(backgroundColor =="red") const Icon(
            Icons.dangerous,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
      gravity: ToastGravity.BOTTOM,
    );
  }

}
