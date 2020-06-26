import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization_setting/localization/set_localization.dart';
import 'package:localization_setting/main.dart';
import 'package:localization_setting/models/language.dart';
import 'package:localization_setting/name_page.dart';
import 'package:localization_setting/routes/route_names.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  double ageYear = 0;
  double ageMonth = 0;
  double ageDay = 0;
  var selectedYear;
  var selectedMonth;
  var selectedDay;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _EmailController = TextEditingController();
  String name_user='';
  String email_user='';
  void _showPicker() {
    showDatePicker(
            context: context,
            firstDate: new DateTime(1900),
            initialDate: new DateTime.now(),
            lastDate: new DateTime.now())
        .then((DateTime dt) {
      setState(() {
        selectedYear = dt.year;
        selectedDay = dt.day;
        selectedMonth = dt.month;
        calculateAge();
      });
    });
  }

  void calculateAge() {
    ageYear = (DateTime.now().month - selectedMonth).toDouble() < 0
        ? (DateTime.now().year - selectedYear).toDouble() - 1
        : (DateTime.now().year - selectedYear).toDouble();
    ageMonth = (DateTime.now().month - selectedMonth).toDouble() >= 0
        ? (DateTime.now().month - selectedMonth).toDouble()
        : 12 + (DateTime.now().month - selectedMonth).toDouble();
    ageDay = (DateTime.now().day - selectedDay).toDouble();
  }
void Submit(){
    print(name_user);
    print(email_user);
 setState(() {
   name_user=_nameController.text;
   email_user=_EmailController.text;
 });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawerList(context),
      appBar: AppBar(
        title: Text(SetLocalization.of(context)
            .getTranslateValue('${NamePageJson.home_page}')),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: DropdownButton(
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.blue,
                size: 30,
              ),
              items: Language.LanguageList()
                  .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                        value: lang,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              lang.flag,
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(
                              lang.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (Language lang) {
                _changeLanguage(lang);
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/15,left: 20,right: 20),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              CalculBirth(context),
              SizedBox(
                height: 50,
              ),
              _mainForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Center CalculBirth(BuildContext context) {
    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 400,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.blue, // set border color
                    width: 5.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                )),
            child: FlatButton(
              child: Center(
                child: new Text(
                  selectedYear != null
                      ? '${selectedYear.toString()}/${selectedMonth.toString()}/${selectedDay.toString()}'
                      : SetLocalization.of(context).getTranslateValue('${NamePageJson.Select_Your_Year_of_Birth}'),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
              ),
              onPressed: _showPicker,
            ),
          ),
          new Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
          ),
          Column(
            children: <Widget>[
              Text(SetLocalization.of(context).getTranslateValue('${NamePageJson.Your_age_is}'),
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
              SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: 400,
//                  color: Color(0xff3D3D3D),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(SetLocalization.of(context).getTranslateValue('${NamePageJson.Year}'),
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic)),
                          Text('${ageYear.toInt()}',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic)),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(SetLocalization.of(context).getTranslateValue('${NamePageJson.Month}'),
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic)),
                          Text('${ageMonth.toInt()}',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic)),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(SetLocalization.of(context).getTranslateValue('${NamePageJson.Day}'),
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.greenAccent,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic)),
                          Text('${ageDay.toInt()}',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Form _mainForm(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: <Widget>[
          Container(
//            color: Colors.blue,
            height: 70,
            child: Center(
              child: Text(
                SetLocalization.of(context).getTranslateValue('${NamePageJson.personal_info}'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TextFormField(
            controller: _nameController,
            validator: (val) {
              if (val.isEmpty) {
                return SetLocalization.of(context)
                    .getTranslateValue('${NamePageJson.required_field}');
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: SetLocalization.of(context)
                  .getTranslateValue('${NamePageJson.name}'),
              hintText: SetLocalization.of(context)
                  .getTranslateValue('${NamePageJson.name_hint}'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _EmailController,
            validator: (val) {
              if (val.isEmpty) {
                return SetLocalization.of(context)
                    .getTranslateValue('${NamePageJson.required_field}');
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: SetLocalization.of(context)
                  .getTranslateValue('${NamePageJson.email}'),
              hintText: SetLocalization.of(context)
                  .getTranslateValue('${NamePageJson.email_hint}'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: Colors.amber,
            height: 50,
            minWidth: 250,
            shape: StadiumBorder(),
            child: Text(
              SetLocalization.of(context).getTranslateValue('${NamePageJson.submit_info}'),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            onPressed:Submit
          )
        ],
      ),
    );
  }

  Widget _drawerList(BuildContext context) {
    TextStyle _textStyle = TextStyle(color: Colors.white, fontSize: 24);
    return Container(
      color: Theme.of(context).primaryColor,
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 25),
            height: 250,
            width: MediaQuery.of(context).size.width / 1.6,
            child: DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 50,
                    minRadius: 50,
                    child: Text(
                      '👤',
                      style: TextStyle(color: Colors.blue, fontSize: 60),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name_user==''||name_user==null?SetLocalization.of(context).getTranslateValue('${NamePageJson.name_hint}'):name_user,
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            email_user==''||email_user==null?SetLocalization.of(context).getTranslateValue('${NamePageJson.email_hint}'):email_user,
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.transparent,
            child: Material(
              elevation: 10,
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.amber,
                  size: 30,
                ),
                title: Text(
                  SetLocalization.of(context)
                      .getTranslateValue('${NamePageJson.about_us}'),
                  style: _textStyle,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, aboutRoute);
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.transparent,
            child: Material(
              elevation: 10,
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.blue,
                  size: 30,
                ),
                title: Text(
                  SetLocalization.of(context)
                      .getTranslateValue('${NamePageJson.settings}'),
                  style: _textStyle,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, settingsRoute);
                },
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(20),
                height: 50,
                color: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.power_settings_new,
                      color: Colors.red[700],
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(SetLocalization.of(context)
                        .getTranslateValue('${NamePageJson.Log_Out}')),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  void _changeLanguage(Language lang) {
    Locale _temp;
    switch (lang.languageCode) {
      case 'en':
        _temp = Locale(lang.languageCode, 'US');
        break;
      case 'ar':
        _temp = Locale(lang.languageCode, 'EG');
        break;
      default:
        _temp = Locale('en', 'US');
        break;
    }
    MyApp.setLocale(context, _temp);
  }
}
