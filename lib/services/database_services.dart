import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:wallet_ui_kit/main.dart';

bool firebaseResults;
String walletCallback;
String token;
String subId;
String callback;
class DatabaseServices {




  final CollectionReference usersCollection =
      Firestore.instance.collection('users');
  Future addUsers(String email, String fname, String sname, String phoneNumber,
      String houseAddress, String imageUrl, String idNumber) async {



    await  getToken();
   // await createWallet();


    //await Future.delayed(Duration(seconds: 100));
    //await getWalletResult();




    return await usersCollection.document(email).setData({
      'email': email,
      'fnames': fname,
      'sname': sname,
      'phoneNumber': phoneNumber,
      'houseAddress': houseAddress,
      'imageUrl': imageUrl,
      'idnumber': idNumber,

    });


  }

  final CollectionReference historyCollection =
      Firestore.instance.collection('history');
  Future addhistory(
    String email,
    String receiver,
    String amount,
    String type,
    String tranactionType,
    String date,
  ) async {
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    return await historyCollection.document(time).setData({
      'email': email,
      'receiver': receiver,
      'amount': amount,
      'type': type,
      'tranactionType': tranactionType,
      'date': date,
    });
  }

  getToken() async {
    Map<String, String> mainheader = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/nboauth/oauth20/token';
    var response = await http.post(
      url,
      headers: mainheader,
      body: {
        'client_id': '1ec68e41-ffce-4309-9c44-eb6f5196dc8e',
        'client_secret': 'dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX',
        'grant_type': 'client_credentials',
        'scope': 'tpp_client_credential'
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      token = jsonResponse['access_token'];
      print('Token is: $token.');
      //print( " testing text " + incomeType + "  " + occupation + "  "+  industryType );

      await  getIntent();
      await createWallet();

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  getIntent() async {
    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/open-banking/v1/subscriptions';
    Map jsonData = {
      "Data": {
        "Permissions": ["DoPeer2Peer"],
        "WalletId": "265993",
        "ToWalletId": "66",
        "Amount": "70"
      }
    };
    var _token = 'Bearer $token';
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.headers.set('x-fapi-financial-id', 'OB/2017/001');
    request.headers.set('Authorization', _token);
    request.headers
        .set('x-ibm-client-id', '1ec68e41-ffce-4309-9c44-eb6f5196dc8e');
    request.headers.set('x-ibm-client-secret',
        'dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX');
    request.add(utf8.encode(json.encode(jsonData)));
    HttpClientResponse response = await request.close();
    // await utf8.decoder.bind(response).forEach(print);
    String reply = await utf8.decoder.bind(response).join();
    httpClient.close();
    print('Response status: $reply');
    var jsonResponse = convert.jsonDecode(reply);
    print('decode: $jsonResponse');
    var subscriptionId = jsonResponse['Data']['subscription_id'];
    subId = subscriptionId;
    print('subscription_id : $subscriptionId');


  }


  createWallet() async {
    var url = 'https://api.nedbank.co.za/apimarket/sandbox/nb-wallet/wallets';
    Map jsonData = {
      "CallbackUrl": "wwww.mbeche.com/store",
      "ExternalUniqueId": subId,
      "FirstName": "Michael",
      "LastName": "Mauer",
      "IdentityNumber": "7803014567893",
      "Msisdn": "27748248292",
      "SourceOfFunds": "1058",
      "Industry": "1007",
      "Occupation":"1403",
      "OccupationOther":"OccupationOther"
    };
    var _token = 'Bearer $token';
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    // request.headers.set('x-fapi-financial-id', 'OB/2017/001');
    request.headers.set('Authorization', _token);
    request.headers
        .set('x-ibm-client-id', '1ec68e41-ffce-4309-9c44-eb6f5196dc8e');
    request.headers.set('x-ibm-client-secret',
        'dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX');
    request.add(utf8.encode(json.encode(jsonData)));
    HttpClientResponse response = await request.close();
    // await utf8.decoder.bind(response).forEach(print);
    String reply = await utf8.decoder.bind(response).join();
    httpClient.close();
    var jsonResponse = convert.jsonDecode(reply);
    var itemCount = jsonResponse['CallbackId'];
    var authUrl = jsonResponse['AuthUrl'];
    callback = itemCount;
    //print('CallbackId: $itemCount.');
    print('Create wallet results : $reply');
    //await showMyDialog();
    walletCallback = authUrl;
  }

  getWalletResult() async {
    var _token = 'Bearer $token';
    Map<String, String> mainheader = {
      "Content-Type": "Application/json",
      //"x-fapi-financial-id":"OB/2017/001",
      "Authorization": _token,
      "x-ibm-client-id": "1ec68e41-ffce-4309-9c44-eb6f5196dc8e",
      "x-ibm-client-secret":
      "dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX",
    };

    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/nb-wallet/callbacks/' +
            callback;
    var response = await http.get(
      url,
      headers: mainheader,
    );
    print('Response status: ${response.statusCode}');
    print('Account Details: ${response.body}');
  }




   showMyDialog() {
    showDialog(
        context: navigatorKey.currentContext,
        builder: (context) => Center(
          child: Material(
            color: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.network('https://via.placeholder.com/150',fit: BoxFit.contain,), // Show your Image
                Align(
                  alignment: Alignment.topRight,
                  child: RaisedButton.icon(
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      label: Text('Close')),
                ),
              ],
            )
          ),
        )
    );
  }

}


