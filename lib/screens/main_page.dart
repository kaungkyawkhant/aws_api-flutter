import 'package:awsapi/constants/constants.dart';
import 'package:awsapi/screens/amazonPage.dart';
import 'package:awsapi/screens/cfPage.dart';
import 'package:awsapi/screens/ec2Page.dart';
import 'package:awsapi/screens/healthCheckPage.dart';
import 'package:awsapi/screens/route53Screen.dart';
import 'package:awsapi/screens/s3page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainPage extends StatefulWidget {
  static const String id = 'mainPage';
  const MainPage({
    Key key,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final normalColor = Colors.lightGreen;
  final pressColor = Colors.white;

  var jsonResult;
  List route53IPList = [];
  List route53RegionList = [];
  List ec2IPaddress = [];
  List ec2Region = [];
  List s3IPaddress = [];
  List s3Region = [];
  List cloudFIPaddress = [];
  List cloudFRegion = [];
  List amazonIPaddress = [];
  List amazonRegion = [];
  List healhCheck = [];
  List healthCheckRegion = [];

  @override
  void initState() {
    parseJson();
    // TODO: implement initState
    super.initState();
  }

  void parseJson() async {
    http.Response response =
        await http.get('https://ip-ranges.amazonaws.com/ip-ranges.json');
    if (response.statusCode == 200) {
      String data = response.body;
      jsonResult = json.decode(data);
    } else {
      print(response.statusCode);
    }
    for (int i = 0; i < 2585; i++) {
      if (jsonResult['prefixes'][i]['service']=='ROUTE53'){
        String a = jsonResult['prefixes'][i]['ip_prefix'];
        String b = jsonResult['prefixes'][i]['region'];
        route53IPList.add(a);
        route53RegionList.add(b);
      } else if (jsonResult['prefixes'][i]['service']=='EC2') {
        String c = jsonResult['prefixes'][i]['ip_prefix'];
        String d = jsonResult['prefixes'][i]['region'];
        ec2IPaddress.add(c);
        ec2Region.add(d);
      }else if (jsonResult['prefixes'][i]['service']=='CLOUDFRONT') {
        String e = jsonResult['prefixes'][i]['ip_prefix'];
        String f = jsonResult['prefixes'][i]['region'];
        cloudFIPaddress.add(e);
        cloudFRegion.add(f);
      }else if (jsonResult['prefixes'][i]['service']=='ROUTE53_HEALTHCHECKS_PUBLISHING') {
        String g = jsonResult['prefixes'][i]['ip_prefix'];
        String h = jsonResult['prefixes'][i]['region'];
        healhCheck.add(g);
        healthCheckRegion.add(h);
      }else if (jsonResult['prefixes'][i]['service']=='S3') {
        String j = jsonResult['prefixes'][i]['ip_prefix'];
        String k = jsonResult['prefixes'][i]['region'];
        s3IPaddress.add(j);
        s3Region.add(k);
      }else if (jsonResult['prefixes'][i]['service']=='AMAZON') {
        String l = jsonResult['prefixes'][i]['ip_prefix'];
        String m = jsonResult['prefixes'][i]['region'];
        amazonIPaddress.add(l);
        amazonRegion.add(m);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Color widgetColor = normalColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('AWS IP Address Viewer'),
        leading: Icon(Icons.cloud_download),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                  child: Image(
                image: AssetImage('assets/images/aws.png'),
              )),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Center(
                    child: Text(
                  'AWS',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              SizedBox(
                height: 50.0,
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 4,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              widgetColor = pressColor;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Route53View(
                                          route53IPList: route53IPList,
                                          route53RegionList: route53RegionList,
                                        )));
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: widgetColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image:
                                      AssetImage('assets/images/ic_r53.png'),
                                  height: 60.0,
                                  width: 60,
                                  colorBlendMode: BlendMode.clear,
                                ),
                                Text('Route 53 IPv4',
                                  style: kTextStyle,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 4,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              widgetColor = pressColor;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Ec2Page(
                                      ec2IPaddress: ec2IPaddress,
                                      ec2Region: ec2Region,
                                    )));
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage('assets/images/ic_ec2.png'),
                                  height: 60.0,
                                  width: 60.0,
                                  colorBlendMode: BlendMode.difference,
                                ),
                                Text(
                                  'EC2 IPv4',
                                  style: kTextStyle,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 4,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CloudFrontPage(
                                    cloudFIPaddress: cloudFIPaddress,
                                    cloudFRegion : cloudFRegion,
                                  )));},
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage('assets/images/ic_cf.png'),
                                  height: 60.0,
                                  width: 60.0,
                                ),
                                Text('Cloud Front IPv4',
                                  style: kTextStyle,textAlign: TextAlign.center,)
                              ],
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 4,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HealthCheckPage(
                                      healhCheck: healhCheck,
                                      healthCheckRegion: healthCheckRegion,
                                    )));
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage('assets/images/ic_r53hc.png'),
                                  height: 60.0,
                                  width: 60.0,
                                ),
                                Text('Route 53 Health Check IPv4',
                                  style: kTextStyle,textAlign: TextAlign.center,)
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 4,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => S3Page(
                                      s3IPaddress: s3IPaddress,
                                      s3Region: s3Region,
                                    )));
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage('assets/images/ic_s3.png'),
                                  height: 60.0,
                                  width: 60.0,
                                ),
                                Text('S3 IPv4',
                                  style: kTextStyle,textAlign: TextAlign.center,)
                              ],
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 4,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AmzPage(
                                      amazonIPaddress: amazonIPaddress,
                                      amazonRegion: amazonRegion,
                                    )));
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage('assets/images/ic_aws.png'),
                                  height: 60.0,
                                  width: 60.0,
                                ),
                                Text('Amazon IPv4',
                                  style: kTextStyle,textAlign: TextAlign.center,)
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
