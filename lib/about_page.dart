import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About', style: TextStyle(fontFamily: "Ubuntu", fontWeight: FontWeight.w300)),
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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text('MCPS Sidekick is a free (& ad-free) client to view & calculate grades for MCPS Students.'),
          Text('MCPS Sidekick stores your username and password unencrypted, but other apps cannot access this data'),
          Text('MCPS Sidekick was created in 2017 by Daniel Hyatt.'),
          Text('This version of MCPS Sidekick is premilinary and hasn\'t been tested extensively. The calculator part of this app will be added soon.'),
          Text('If you spot a bug or something - '),
          GestureDetector(
              onTap: () async {
                if(await canLaunch('mailto:support@mcps.app')) {
                  await launch('mailto:support@mcps.app');
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Error opening email app')));
                }
              },
              child: Text('support@mcps.app', style: TextStyle(decoration: TextDecoration.underline))
          ),
          Text('Note: after I graduate this year (2021), I will not be maintaining this app. If you\'d be interested in maintaining MCPS Sidekick, contact me.'),
          Text('Fun fact: MCPS Sidekick is open source. The code running this app is available here:'),
          GestureDetector(
              onTap: () async {
                if(await canLaunch('https://github.com/dannyhyatt/mcps_sidekick')) {
                  await launch('https://github.com/dannyhyatt/mcps_sidekick');
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Error opening email app')));
                }
              },
              child: Text('https://github.com/dannyhyatt/mcps_sidekick', style: TextStyle(decoration: TextDecoration.underline))
          ),
        ],
      ),
    );
  }
}
