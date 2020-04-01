import 'package:flutter/material.dart';

class ChallengeType {
  final String title;
  final String route;
  bool enabled;
  Icon icon;
  ChallengeType(this.title, this.route, {this.enabled=true, this.icon});
}