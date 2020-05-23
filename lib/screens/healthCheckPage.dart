import 'package:flutter/material.dart';

class HealthCheckPage extends StatefulWidget {
  static const String id = 'HealthCheck';
  List healhCheck, healthCheckRegion;
  HealthCheckPage({this.healhCheck,this.healthCheckRegion});
  @override
  _HealthCheckPageState createState() => _HealthCheckPageState();
}

class _HealthCheckPageState extends State<HealthCheckPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Health Check IP Subnet List'),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.lightGreenAccent,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 15.0,),
                    Expanded(flex: 3, child: Text('IP Subnets'),),
                    Expanded(flex: 1, child: Text('Regions'),),
                    SizedBox(width: 15.0,),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.healhCheck.length,
                    padding: EdgeInsets.all(20.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(widget.healhCheck[index]),
                                Text(widget.healthCheckRegion[index]),
                              ],
                            ),
                            const Divider(
                              color: Colors.teal,
                              thickness: 0,
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
