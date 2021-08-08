import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo/log in.dart';
import 'package:insta_demo/signup.dart';
import 'package:insta_demo/bottomnav.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:auth_buttons/auth_buttons.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insta Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: new AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser != null) {
      return NavBottom();
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Instagram',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Billabong',
                )),
            SizedBox(height: 50),
            FlatButton(
                height: 50,
                minWidth: 300,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => login()),
                  );
                },
                child: Text('Log In', style: TextStyle(color: Colors.white)),
                color: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.white,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10))),
            SizedBox(height: 50),
            FlatButton(
              height: 50,
              minWidth: 300,
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => signup()));
              },
              child: Text('Sign Up', style: TextStyle(color: Colors.lightBlue)),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.lightBlue,
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(height: 50),
            FacebookAuthButton(
              onPressed: () async {
                await loginWithFacebook();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => NavBottom()),
                );
              },
            ),
          ],
        )));
  }

  String your_client_id = '1098746340884848';
  String your_redirect_url =
      "https://www.facebook.com/connect/login_success.html";

  loginWithFacebook() async {
    String result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CustomWebView(
                  selectedUrl:
                      'https://www.facebook.com/dialog/oauth?client_id=$your_client_id&redirect_uri=$your_redirect_url&response_type=token&scope=email,public_profile,',
                ),
            maintainState: true));
    if (result != null) {
      try {
        final facebookAuthCred = FacebookAuthProvider.credential(result);
        await auth.signInWithCredential(facebookAuthCred);
      } catch (e) {}
    }
  }
}

class CustomWebView extends StatefulWidget {
  final String selectedUrl;

  CustomWebView({required this.selectedUrl});

  @override
  _CustomWebViewState createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (url.contains("#access_token")) {
        succeed(url);
      }

      if (url.contains(
          "https://www.facebook.com/connect/login_success.html?error=access_denied&error_code=200&error_description=Permissions+error&error_reason=user_denied")) {
        denied();
      }
    });
  }

  denied() {
    Navigator.pop(context);
  }

  succeed(String url) {
    var params = url.split("access_token=");

    var endparam = params[1].split("&");

    Navigator.pop(context, endparam[0]);
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: widget.selectedUrl,
        appBar: new AppBar(
          backgroundColor: Color.fromRGBO(66, 103, 178, 1),
          title: new Text("Facebook login"),
        ));
  }
}
