import 'package:dough/dough.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'studentvue.dart';
import 'class_info_page.dart';
import 'grades_page.dart';

class SchoolClassPage extends StatefulWidget {

  final SchoolClass schoolClass;
  SchoolClassPage(this.schoolClass);

  @override
  _SchoolClassPageState createState() => _SchoolClassPageState();
}

class _SchoolClassPageState extends State<SchoolClassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.schoolClass.className ?? 'Class', style: TextStyle(fontFamily: "Ubuntu", fontWeight: FontWeight.w300)),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    ...List.filled(4, SchoolClass.getColorFromPctGrade(widget.schoolClass.pctGrade)),
                    Colors.blue
                  ])
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => SchoolClassInfoPage(widget.schoolClass)));
            }
          )
        ],
      ),
      body: ListView(
        children: [
          Card(
            child: Container(
              child: Row(
                children: [
                  Text('Current Grade: ${(widget.schoolClass.pctGrade ?? 'N/A') == 'N/A' ? 'N/A' : widget.schoolClass.pctGrade + '%'}',
                    style: Theme.of(context).textTheme.headline6),
                ],
              ),
              margin: EdgeInsets.all(8),
            ),
          ),
          PressableDough(
            child: Card(
              child: ExpandablePanel(
                header: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Categories', style: Theme.of(context).textTheme.headline6),
                ),
                expanded: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: _getCategories()
                  ),
                ),
              ),
            ),
          ),
          PressableDough(
            child: Card(
              child: ExpandablePanel(
                controller: ExpandableController()..expanded=true,
                header: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Assignments', style: Theme.of(context).textTheme.headline6),
                ),
                collapsed: Container(),
                expanded: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      children: _getAssignments()
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _getCategories() {
    List<Widget> ret = List<Widget>();
    if (widget.schoolClass.assignmentCategories == null || widget.schoolClass.assignmentCategories.length == 0) return [Text('No categories')];
    widget.schoolClass.assignmentCategories.forEach((el) {
      if(el.name == null) return;
      ret.add(
        Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${el.name}', maxLines: 2, style: Theme.of(context).textTheme.headline6),
                  Text('Weight ${el.weight}')
                ],
              ),
              Column(
                children: [
                  Text(SchoolClass.getLetterFromPctGrade('${el.possiblePoints == 0 || el.possiblePoints == null ? '' : SchoolClass.getLetterFromPctGrade('${el.earnedPoints / el.possiblePoints}')}'), maxLines: 2, style: Theme.of(context).textTheme.headline6),
                  Text('${el.earnedPoints ?? ''} / ${el.possiblePoints ?? ''}')
                ],
              )
            ],
          ),
        )
      );
    });
    return ret;
  }

  List<Widget> _getAssignments() {
    List<Widget> ret = List<Widget>();
    if (widget.schoolClass.assignments == null || widget.schoolClass.assignments.length == 0) return [Text('No Assignments')];
    widget.schoolClass.assignments.forEach((el) {
      if(el.assignmentName == 'Assignment' && el.possiblePoints == -1) return;
      ret.add(
        Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(el.assignmentName ?? 'Unnamed Assignment', maxLines: 4, style: Theme.of(context).textTheme.headline6),
                    Text(el.category ?? 'Uncategorized', maxLines: 2, textAlign: TextAlign.left)
                  ],
                ),
                width: MediaQuery.of(context).size.width*0.7,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  el.earnedPoints == -1 ? Text('') : Text(el.earnedPoints == null || el.earnedPoints == -1 ? '' : '${el.earnedPoints * 100 / el.possiblePoints}'.substring(0, 4 > '${el.earnedPoints / el.possiblePoints}'.length ? '${el.earnedPoints / el.possiblePoints}'.length : 4) + '%',
                    style: Theme.of(context).textTheme.headline6,),
                  Text('${(el.earnedPoints == -1 ? null : el.earnedPoints) ?? ''} / ${el.possiblePoints ?? ''}')
                ],
              )
            ],
          ),
        )
      );
    });
    return ret;
  }
}
