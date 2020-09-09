import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sidekick_mcps/login_page.dart';
import 'grades_page.dart';
import 'main.dart';

import 'studentvue.dart';

class LoadingPage extends StatefulWidget {

  final String username, password;
  LoadingPage({this.username, this.password});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    () async {
      try {
        StudentVueData svData = await StudentVueClient(widget.username, widget.password).getData();
        sp.setString('username', widget.username);
        sp.setString('password', widget.password);
        LoginPage.errorMsg = ''; // reset error msg
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => GradesPage(svData)));
      } catch(e) {
//        LoginPage.errorMsg = 'Error logging in';
//        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
      }

    }();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(),
            SpinKitChasingDots(
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    color: index.isEven ? Colors.blue : Colors.green,
                  ),
                );
              },
            ),
            GestureDetector(
              child: Text('Cancel >', style: TextStyle(decoration: TextDecoration.underline)),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
              },
            )
          ],
        )
      ),
    );
  }
}
