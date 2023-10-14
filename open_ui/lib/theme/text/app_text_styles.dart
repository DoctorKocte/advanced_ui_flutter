import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles();

  static const String _familyGilroy = 'Gilroy';
 
   static const TextStyle title = TextStyle(
    fontFamily: _familyGilroy,
    fontStyle: FontStyle.normal,
    fontSize: 25,
    fontWeight: FontWeight.w800
  );

// shop name
  static const TextStyle boldSubtitle = TextStyle(
    fontFamily: _familyGilroy,
    fontStyle: FontStyle.normal,
    fontSize: 20,
    fontWeight: FontWeight.w800
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: _familyGilroy,
    fontStyle: FontStyle.normal,
    fontSize: 20,
    fontWeight: FontWeight.w700
  );

  static const TextStyle boldH4 = TextStyle(
    fontFamily: _familyGilroy,
    fontStyle: FontStyle.normal,
    fontSize: 16,
    fontWeight: FontWeight.w600
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: _familyGilroy,
    fontStyle: FontStyle.normal,
    fontSize: 16,
    fontWeight: FontWeight.w500
  );
 
   static const TextStyle h5 = TextStyle(
    fontFamily: _familyGilroy,
    fontStyle: FontStyle.normal,
    fontSize: 15,
    fontWeight: FontWeight.w700
  );

// price
  static const TextStyle lightH5 = TextStyle(
    fontFamily: _familyGilroy,
    fontStyle: FontStyle.normal,
    fontSize: 15,
    fontWeight: FontWeight.w600
  );

  // price
  static const TextStyle subtitleLightH5 = TextStyle(
    fontFamily: _familyGilroy,
    fontStyle: FontStyle.normal,
    fontSize: 15,
    fontWeight: FontWeight.w500
  );


// sale card names
  static const TextStyle lightSubtitle = TextStyle(
    fontFamily: _familyGilroy,
    fontStyle: FontStyle.normal,
    fontSize: 13,
    fontWeight: FontWeight.w500
  );

// holidays select
  static const TextStyle h6 = TextStyle(
    fontFamily: _familyGilroy,
    fontStyle: FontStyle.normal,
    fontSize: 10,
    fontWeight: FontWeight.w700
  );

// holidays diselect
    static const TextStyle lightH6 = TextStyle(
    fontFamily: _familyGilroy,
    fontStyle: FontStyle.normal,
    fontSize: 10,
    fontWeight: FontWeight.w500
  );
}
