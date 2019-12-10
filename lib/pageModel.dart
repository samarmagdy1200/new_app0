import 'package:flutter/material.dart';

class PageModel {
  String _image;
  String _title;
  IconData _icon;
  String _description;

  PageModel(this._image, this._title, this._icon, this._description);

  String get image => _image;

  String get title => _title;

  IconData get icon => _icon;

  String get description => _description;
}
