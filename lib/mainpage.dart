import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String coinValue = "USD";

  String getResponseBody;
  int btcValue = 0;
  int ethValue = 0;
  int ltcValue = 0;

  List<String> crypto = ['BTC','ETH','LTC'];

  List<DropdownMenuItem> itemMember()
  {
    List <DropdownMenuItem<String>> item = [];
    for(String newItem in coin)
    {
        var dropdownItem = DropdownMenuItem(
          value: newItem,
          child: Text(newItem,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize:18.0,),),
        );
        item.add(dropdownItem);
    }
    return item;
  }

  void getData()
  async {
    try{
      CoinData coinData = new CoinData();
      String getResponseBody = await coinData.conversionUrl(coinValue);
      double valueBTC = jsonDecode(getResponseBody)['rates']['BTC'];
      double valueETH = jsonDecode(getResponseBody)['rates']['ETH'];
      double valueLTC = jsonDecode(getResponseBody)['rates']['LTC'];
      setState(() {
        btcValue = valueBTC.toInt();
        ethValue = valueETH.toInt();
        ltcValue = valueLTC.toInt();
      });
    }
    catch(e)
    {
      print(e);
    }
  }

  Widget processing()
  {
    getData();
    if(btcValue==0)
      {
        return SpinKitRing(
          color: Colors.blueAccent,
          size: 40.0,
        );
      }
    else
      {
        return Container(
          color: Colors.white,
        );
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("₹ Converter ",
        style: TextStyle(
          fontSize: 30.0,
        ),),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CryptoCurrency(
              intValue: btcValue,
              coinValue: coinValue,
              padding: EdgeInsets.fromLTRB(20.0,30.0, 20.0,0),
              text: Text("1 ${crypto[0]} =  $btcValue $coinValue",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,),
          ),
          CryptoCurrency(
            intValue: ethValue,
            coinValue: coinValue,
            padding: EdgeInsets.fromLTRB(20.0,5.0, 20.0,0),
            text: Text("1 ${crypto[1]} =  $ethValue $coinValue",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,),
          ),
          CryptoCurrency(
              intValue: ltcValue,
              coinValue: coinValue,
              padding: EdgeInsets.fromLTRB(20.0,5.0, 20.0,0),
            text: Text("1 ${crypto[2]} =  $ltcValue $coinValue",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: processing(),
          ),
          Container(  
            margin: EdgeInsets.all(5.0),
            height: 120.0,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: DropdownButton<String>(
                value: coinValue,
                items: itemMember(),
                onChanged: (value)
                  {
                      setState(() {
                        coinValue = value;
                        btcValue = 0;
                        ethValue = 0;
                        ltcValue = 0;
                        getData();
                      });
                  },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CryptoCurrency extends StatelessWidget {
  CryptoCurrency({
    @required this.intValue,
    @required this.coinValue,
    @required this.padding,
    @required this.text,
  }) ;


  final int intValue;
  final String coinValue;
  final EdgeInsetsGeometry padding;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Card(
        elevation: 5.0,
        color: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: text,
        ),
      ),
    );
  }
}
