import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Sample {
  String? name;
  FaIcon? icons;
  VoidCallback onTap;

  Sample(this.name, this.icons, this.onTap);
}
