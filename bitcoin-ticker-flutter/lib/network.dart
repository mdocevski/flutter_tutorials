import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking {
  static const String _API_KEY = '5396A4F2-E3EF-4DF1-8305-EE8108A04C39';
  static const String _BASE_API_URL = 'https://rest.coinapi.io';

  static String _exchangeRateUrl(
    String baseAssetIdentifier,
    String quoteAssetIdentifier,
    String time,
  ) =>
      _BASE_API_URL +
      '/v1/exchangerate/$baseAssetIdentifier/$quoteAssetIdentifier' +
      '?apikey=$_API_KEY' +
      (time != null ? '&time=$time' : '');

  static Future getExchangeRate({
    String baseAssetIdentifier,
    String quoteAssetIdentifier,
  }) async {
    var response = await http.get(_exchangeRateUrl(
      baseAssetIdentifier,
      quoteAssetIdentifier,
      null,
    ));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw 'Error fetching the exchange rate, code: ${response.statusCode}';
    }
  }
}
