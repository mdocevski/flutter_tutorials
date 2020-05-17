import 'dart:io' show Platform;

import 'package:bitcoin_ticker/network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'coin_data.dart';

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency;
  String conversionRateBitcoin;
  String conversionRateEtherium;
  String conversionRateLitecoint;
  Future runningFetch;

  @override
  void initState() {
    super.initState();
    onSelectedCurrencyChanged(currenciesList.first);
  }

  void fetchConversion() async {
    try {
      var bitcoinResponse = Networking.getExchangeRate(
        baseAssetIdentifier: 'BTC',
        quoteAssetIdentifier: selectedCurrency,
      );

      var etheriumResponse = Networking.getExchangeRate(
        baseAssetIdentifier: 'ETH',
        quoteAssetIdentifier: selectedCurrency,
      );
      var litecoinResponse = Networking.getExchangeRate(
        baseAssetIdentifier: 'LTC',
        quoteAssetIdentifier: selectedCurrency,
      );

      bitcoinResponse.then((value) {
        setState(() {
          conversionRateBitcoin = NumberFormat(
            '.##',
            Localizations.localeOf(context).languageCode,
          ).format(value['rate']);
        });
      });

      etheriumResponse.then((value) {
        setState(() {
          conversionRateEtherium = NumberFormat(
            '.##',
            Localizations.localeOf(context).languageCode,
          ).format(value['rate']);
        });
      });

      litecoinResponse.then((value) {
        setState(() {
          conversionRateLitecoint = NumberFormat(
            '.##',
            Localizations.localeOf(context).languageCode,
          ).format(value['rate']);
        });
      });
    } catch (e) {
      print(e);
    }
  }

  void onSelectedCurrencyChanged(String newSelectedCurrency) {
    setState(() {
      selectedCurrency = newSelectedCurrency;
      conversionRateBitcoin = '----';
      conversionRateEtherium = '----';
      conversionRateLitecoint = '----';
      fetchConversion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $conversionRateBitcoin $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $conversionRateEtherium $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $conversionRateLitecoint $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: currencyPicker(),
          ),
        ],
      ),
    );
  }

  Widget currencyPicker() {
    if (Platform.isIOS) {
      return cupertinoPicker();
    } else {
      return materialDropdown();
    }
  }

  CupertinoPicker cupertinoPicker() => CupertinoPicker(
        itemExtent: 40.0,
        onSelectedItemChanged: (selectedIndex) {
          onSelectedCurrencyChanged(currenciesList[selectedIndex]);
        },
        children: <Widget>[
          for (String currency in currenciesList)
            Center(
                child: Text(
              currency,
              style: TextStyle(
                color: Colors.white,
              ),
            ))
        ],
      );

  DropdownButton materialDropdown() => DropdownButton(
        items: [
          for (String currency in currenciesList)
            DropdownMenuItem(
              child: Text(currency),
              value: currency,
            ),
        ],
        onChanged: (value) {
          onSelectedCurrencyChanged(value);
        },
        value: selectedCurrency,
      );
}

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}
