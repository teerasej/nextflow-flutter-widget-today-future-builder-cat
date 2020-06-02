import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nextflow_widget_futurebuilder/cat_result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nextflow Flutter Widget Today',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter 3 นาที: FutureBuilder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  String url = '';
  String apiUrl = 'https://api.thecatapi.com/v1/images/search';

  Future<String>  getCatImageUrl() async {
    var response = await http.get(apiUrl);
    print(response.body);
    return catResultFromJson(response.body)[0].url;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                          color: Colors.blue,
                          child: Text(
                            'สุ่มภาพแมว',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onPressed: () {
                            setState(() {
                              
                            });
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CircularProgressIndicator()
              ],
            )));
  }
}
