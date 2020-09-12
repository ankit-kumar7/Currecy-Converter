import 'package:http/http.dart' as http;

class CoinData {

  String apiAccessKey = "aeef09ee26ab0f90e739795f5746ad28";

  Future<String> conversionUrl(String getValue)
  async {
   try{
     http.Response response = await http.get("http://api.coinlayer.com/api/live?access_key=$apiAccessKey&target=$getValue&symbol=BTC");
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
