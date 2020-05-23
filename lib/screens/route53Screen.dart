import 'package:flutter/material.dart';

class Route53View extends StatefulWidget {
  static const String id = 'route53';
  final List route53IPList, route53RegionList;
  Route53View({this.route53IPList, this.route53RegionList});

  @override
  _Route53ViewState createState() => _Route53ViewState();
}

class _Route53ViewState extends State<Route53View> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Route 53 IP Address List'),
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
                    Text('IP Subnets'),
                    SizedBox(width: 200.0,),
                    Text('Region Names'),
                    SizedBox(width: 15.0,),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.route53IPList.length,
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
                                Text(widget.route53IPList[index]),
                                Text(widget.route53RegionList[index]),
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
