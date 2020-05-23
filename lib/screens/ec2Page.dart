import 'package:flutter/material.dart';

class Ec2Page extends StatefulWidget {
  static const String id = 'ec2';
  List ec2IPaddress, ec2Region;
  Ec2Page({this.ec2IPaddress, this.ec2Region});

  @override
  _Ec2PageState createState() => _Ec2PageState();
}

class _Ec2PageState extends State<Ec2Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('EC2 IP Subnet List'),
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
                    itemCount: widget.ec2IPaddress.length,
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
                                Text(widget.ec2IPaddress[index]),
                                Text(widget.ec2Region[index]),
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
