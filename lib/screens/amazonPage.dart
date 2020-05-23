import 'package:flutter/material.dart';

class AmzPage extends StatefulWidget {
  static const String id = 'Amazon';
  List amazonIPaddress, amazonRegion;
  AmzPage({this.amazonIPaddress, this.amazonRegion});

  @override
  _AmzPageState createState() => _AmzPageState();
}

class _AmzPageState extends State<AmzPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Amazon IP Subnet List'),
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
                    shrinkWrap: true,
                    itemCount: widget.amazonIPaddress.length,
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
                                Text(widget.amazonIPaddress[index]),
                                Text(widget.amazonRegion[index]),
                              ],
                            ),
                            const Divider(
                              color: Colors.teal,
                              thickness: 0,
                              height: 0,
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
