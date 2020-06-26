import 'package:flutter/material.dart';
import 'package:localization_setting/localization/set_localization.dart';

import '../name_page.dart';
class Settingpage extends StatefulWidget {
  @override
  _SettingpageState createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(SetLocalization.of(context).getTranslateValue('${NamePageJson.setting_page}')),),
    );
  }
}
