import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:sidekick_mcps/class_page.dart';
import 'studentvue.dart';

class GradesPage extends StatefulWidget {

  final StudentVueData svData;
  GradesPage(this.svData);

  @override
  _GradesPageState createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Classes', style: TextStyle(fontFamily: "Ubuntu", fontWeight: FontWeight.w300)),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
//                    Colors.green,
                    ..._getGradesGradient(),
//                    Colors.blue
                  ])
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.svData.classes.length,
        itemBuilder: (BuildContext ctx, int index) {
          SchoolClass currentClass = widget.svData.classes[index];
          return PressableDough(
            child: Card(
              elevation: 8,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          ...List.filled(3, SchoolClass.getColorFromPctGrade(currentClass.pctGrade)),
                          SchoolClass.getColorFromPctGrade(currentClass.pctGrade).withOpacity(0.5)
                        ])
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SchoolClassPage(currentClass)));
                  },
                  child: Container(
                    color: Color(0xffffffff),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                    padding: EdgeInsets.fromLTRB(8, 16, 8, 12),
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentClass.className ?? '', style: Theme.of(context).textTheme.headline6),
                            Text('${currentClass.classTeacher}, ${currentClass.period}')
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(SchoolClass.getLetterFromPctGrade(currentClass.pctGrade) ?? '', style: Theme.of(context).textTheme.headline6),
                            Text('${currentClass.pctGrade == null || currentClass.pctGrade == 'N/A' ? 'N/A' : currentClass.pctGrade + '%'}')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Color> _getGradesGradient() {
    List<Color> gradient = List<Color>();
    widget.svData.classes.forEach((element) {
      Color currentColor = SchoolClass.getColorFromPctGrade(element.pctGrade);
      if(currentColor != Colors.black54) {
        gradient.add(currentColor);
      }
    });
    if(gradient.length == 0) { // placeholder if no gradea re added
      gradient.add(Colors.black54);
    }
    if(gradient.length == 1) { // need at least two colors for gradient
      gradient.add(gradient[0]);
    }
    gradient[gradient.length-1] = gradient[gradient.length-1].withOpacity(0.8);
    return gradient;
  }
}
