import 'package:flutter/material.dart';
import 'package:localization_setting/localization/set_localization.dart';
import 'package:localization_setting/routes/route_names.dart';

import '../name_page.dart';
class Aboutpage extends StatefulWidget {
  @override
  _AboutpageState createState() => _AboutpageState();
}

class _AboutpageState extends State<Aboutpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SetLocalization.of(context).getTranslateValue('${NamePageJson.about_page}')),),
      body: Center(
        child: Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: MaterialButton(
            color: Colors.transparent,
            elevation: 0,
            child: Row(
              children: <Widget>[
                Icon(Icons.settings,size: 30,color: Colors.black,),
                SizedBox(width: 5,),
                Text(SetLocalization.of(context).getTranslateValue('${NamePageJson.To_Settings_Page}'),style: TextStyle(fontSize: 20),),
              ],
            ),
            onPressed: (){
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
        ),
      ),
    );
  }
}
