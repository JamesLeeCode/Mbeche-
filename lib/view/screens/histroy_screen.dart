import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/view/screens/step/login_screen.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/Illustration/Untitled-1.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                CustomAppBar(
                    title: "Your Transaction History",
                    color: ColorResources.COLOR_WHITE),
                Expanded(
                  child: StreamBuilder(
                      stream: Firestore.instance
                          .collection('history')
                          .where("email", isEqualTo: loggedInUser)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: Text('Loading...'));
                        } else {
                          // DocumentSnapshot ds = snapshot.data.documents[0];
                          return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (ctx, i) {
                                DocumentSnapshot ds =
                                    snapshot.data.documents[i];
                                return OneHistory(
                                    ds["receiver"],
                                    ds["amount"],
                                    ds["type"],
                                    ds["tranactionType"],
                                    ds["date"]);
                              });
                        }
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OneHistory extends StatelessWidget {
  final String receiver, amount, type, tranactionType, date;
  OneHistory(
      this.receiver, this.amount, this.type, this.tranactionType, this.date);
  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(55, 65, 104, 1),
        ),
        child: ListTile(
          title: Text(
            "Receiver: $receiver",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          subtitle: Text(
            "Transation Reference: $type",
            style: TextStyle(color: Colors.white),
          ),
          contentPadding:
              EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                tranactionType,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.greenAccent),
              ),
              Text(
                amount,
                style: TextStyle(color: Colors.greenAccent),
              ),
              Text(
                date,
                style: TextStyle(color: Colors.greenAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
