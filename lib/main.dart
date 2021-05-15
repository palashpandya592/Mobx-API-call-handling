import 'package:flutter/material.dart';
import 'Screen/FirstDemoHome.dart';
import 'Screen/ThirdDemoPage.dart';
import 'Screen/SecondDemoPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MobX',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage()
        );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mobx Demo',
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              btnName: 'Mobx Counter Demo',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FirstDemoPage(),
                    ));
              },
            ),
            SizedBox(height: 10),
            CustomElevatedButton(
              btnName: 'Mobx API Demo Pagination',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondDemoPage(),
                    ));
              },
            ),
            SizedBox(height: 10),
            CustomElevatedButton(
              btnName: 'Mobx API Demo',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdDemoPage(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String btnName;
  final Function onPress;
  CustomElevatedButton({this.btnName, this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child:
            Text(btnName, style: TextStyle(fontSize: 14, color: Colors.white)),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Colors.blue)))),
        onPressed: onPress);
  }
}
