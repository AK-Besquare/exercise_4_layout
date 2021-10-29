import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'UserModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: ReadJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<UserModel>;
          return ListView.builder(
              // ignore: unnecessary_null_comparison
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6,),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(items[index].imageURL.toString()),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  items[index].first_name.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                                
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  items[index].last_name.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                                
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  items[index].status.toString(),
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.cyan),
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                               

                             
                            ],
                          ),
                          
                        )),
                        Container(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  items[index].last_seen_time.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    backgroundColor: Colors.greenAccent,
                                    
                                    
                                  ),
                                ),
                              ),
                       Container(
                              
                          margin: EdgeInsets.only(top: 10,right: 30,left: 25 ),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(width: 3),
                            
                            // You can use like this way or like the below line
                            //borderRadius: new BorderRadius.circular(30.0),

                            
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  items[index].messages.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                            ],
                          ),
                        )
                        
                      ],
                    ),
                  ),
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      
    ));
  }

  // ignore: non_constant_identifier_names
  Future<List<UserModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfile/users.json');
    final list = json.decode(jsondata) as List<dynamic>;
    print(list);
    return list.map((e) => UserModel.fromJson(e)).toList();
  }
}