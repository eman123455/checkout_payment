import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const TextStyle style25= TextStyle(
    color: Colors.black,
    fontFamily: 'inter',
    fontWeight: .w500,
    fontSize: 25,
  );
  static const TextStyle style24= TextStyle(
    color: Colors.black,
    fontFamily: 'inter',
    fontWeight: .w600,
    fontSize: 24,
  );
  static TextStyle style20= TextStyle(
    color: Colors.black.withValues(alpha: 0.8),
    fontFamily: 'inter',
    fontWeight: .w400,
    fontSize: 20,
  );
  static const TextStyle style18= TextStyle(
    color: Colors.black,
    fontFamily: 'inter',
    fontWeight: .w400,
    fontSize: 18,

  );
  static const  TextStyle style18Bold= TextStyle(
    color: Colors.black,
    fontFamily: 'inter',
    fontWeight: .w600,
    fontSize: 18,
  );
}
