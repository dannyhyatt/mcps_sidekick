import 'package:flutter/material.dart';
import 'package:sidekick_mcps/about_page.dart';
import 'loading_page.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {

  static String errorMsg = '';

  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController usernameController = TextEditingController(), passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    usernameController.text = sp.getString('username') ?? '';
    passwordController.text = sp.getString('password') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MCPS Sidekick', style: TextStyle(fontFamily: "Ubuntu", fontWeight: FontWeight.w300)),
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
      body: Center(
        child: Container(
          margin: EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Login to MCPS StudentVue\n',
                  style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w300),
                ),
                LoginPage.errorMsg == '' ? Container() : Text(
                  LoginPage.errorMsg + '\n',
                  style: TextStyle(color: Colors.red),
                ),
                TextField(
                  style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                      hintText: 'Username'
                  ),
                  controller: usernameController,
                ),
                Padding(padding: EdgeInsets.all(4)),
                TextField(
                  style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w300),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  controller: passwordController,
                ),
                Text(' '),
                Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Colors.green,
                            Colors.green.shade500,
                            Colors.blue,
                          ])
                  ),
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoadingPage(username: usernameController.text, password: passwordController.text)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Text('Log in', style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w300, color: Colors.white)),
                          margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Text('\nAbout MCPS Sidekick >', style: TextStyle(decoration: TextDecoration.underline)),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => AboutPage()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
