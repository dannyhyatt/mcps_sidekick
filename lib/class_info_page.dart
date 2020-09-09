import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'studentvue.dart';

class SchoolClassInfoPage extends StatefulWidget {

  final SchoolClass schoolClass;
  SchoolClassInfoPage(this.schoolClass);

  @override
  _SchoolClassInfoPageState createState() => _SchoolClassInfoPageState();
}

class _SchoolClassInfoPageState extends State<SchoolClassInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.schoolClass.className ?? 'Class Info', style: TextStyle(fontFamily: "Ubuntu", fontWeight: FontWeight.w300)),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.green,
                    Colors.blue
                  ])
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ..._infoBuilder('Teacher', widget.schoolClass.classTeacher),
            ...[
                Text('Teacher Email:', style: Theme.of(context).textTheme.headline6,),
                widget.schoolClass.classTeacherEmail == null || widget.schoolClass.classTeacherEmail == 'N/A' ?
                  Text(widget.schoolClass.classTeacherEmail ?? 'N/A') :
                  GestureDetector(
                    onTap: () async {
                      if(await canLaunch('mailto:${widget.schoolClass.classTeacherEmail}')) {
                        await launch('mailto:${widget.schoolClass.classTeacherEmail}');
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Error opening email app')));
                      }
                    },
                    child: Text(widget.schoolClass.classTeacherEmail ?? 'N/A', style: Theme.of(context).textTheme.headline5.copyWith(decoration: TextDecoration.underline))
                  ),
                Divider(color: Colors.transparent, thickness: 8,)
            ],
            ..._infoBuilder('Period', '${widget.schoolClass.period}'),
            ..._infoBuilder('Room', widget.schoolClass.roomNumber),
//            ..._infoBuilder('Marking Period', widget.schoolClass.markingPeriod),
          ],
        ),
      )
    );
  }

  List<Widget> _infoBuilder(String param, String data) {
    return [
        Text(param + ':', style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.left),
        Text(data ?? 'N/A', style: Theme.of(context).textTheme.headline5, textAlign: TextAlign.left),
        Divider(color: Colors.transparent, thickness: 8,)
      ];
  }
}
