import 'package:http/http.dart' as http;

class CoinData {

  String apiAccessKey = "fa2c00e83117d2fb65e1ce9cd923ded1";

  Future<String> conversionUrl(String getValue)
  async {
   try{
     http.Response response = await http.get("https://api.nomics.com/v1/currencies/ticker?key=$apiAccessKey&ids=BTC,ETH,LTC&convert=$getValue");
     return response.body;
   }
   catch(e)
    {
      return e;
    }
  }


}

  List<String> coin = [
    ''
    'AUD',
    'BRL',
    'CAD',
    'CNY',
    'EUR',
    'GBP',
    'HKD',
    'IDR',
    'ILS',
    'INR',
    'JPY',
    'MXN',
    'NOK',
    'NZD',
    'PLN',
    'RON',
    'RUB',
    'SEK',
    'SGD',
    'USD',
    'ZAR'
  ];
