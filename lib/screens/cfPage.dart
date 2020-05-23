import 'package:flutter/material.dart';

class CloudFrontPage extends StatefulWidget {
  static const String id = 'cloudfront';
  List cloudFIPaddress, cloudFRegion;
  CloudFrontPage({this.cloudFIPaddress,this.cloudFRegion});

  @override
  _CloudFrontPageState createState() => _CloudFrontPageState();
}

class _CloudFrontPageState extends State<CloudFrontPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cloud Front IP Subnet List'),
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
                    itemCount: widget.cloudFIPaddress.length,
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
                                Text(widget.cloudFIPaddress[index]),
                                Text(widget.cloudFRegion[index]),
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
