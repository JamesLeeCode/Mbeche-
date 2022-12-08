import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/send_money1_screen.dart';
import 'package:wallet_ui_kit/view/screens/step/login_screen.dart';
import 'package:wallet_ui_kit/view/screens/terms.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';


class BenefciariesScreen extends StatefulWidget {
  @override
  _BenefciariesScreen createState() => _BenefciariesScreen();
}

class _BenefciariesScreen extends State<BenefciariesScreen> {
  final FlutterContactPicker _contactPicker = new FlutterContactPicker();
  Contact _contact;
  String firebaseError;
  File _image;
  String _uploadedFileURL;
  Future uploadHouseImage() async {
    try {
      StorageReference storageReference = FirebaseStorage.instance
          .ref()
          .child('users/${Path.basename(_image.path)}');
      StorageUploadTask uploadTask = storageReference.putFile(_image);
      await uploadTask.onComplete;
      storageReference.getDownloadURL().then((fileURL) {
        setState(() {
          _uploadedFileURL = fileURL;
        });
      });

      return true;
    } catch (e) {
      firebaseError = e.toString();
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: loadingPage
            ? LoadingPage()
            : Stack(
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
            StreamBuilder(
                stream: Firestore.instance
                    .collection('users')
                    .where("email", isEqualTo: loggedInUser)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('Loading...'));
                  } else {
                    DocumentSnapshot ds = snapshot.data.documents[0];
                    return SafeArea(
                      child: Column(
                        children: [
                          CustomAppBar1(
                              title: "Beneficiaries",
                              color: ColorResources.COLOR_WHITE),

                          Expanded(
                            child: ListView(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.all(10),
                                children: [
                                  // Buttons


                                  ListTile(
                                    onTap: () async {
                                      Contact contact = await _contactPicker.selectContact();
                                      setState(() {
                                        _contact = contact;
                                      });
                                    },
                                    leading: CircleAvatar(
                                      child: Icon(Icons.picture_as_pdf,
                                          color: ColorResources
                                              .COLOR_MEDIUM_VIOLET_RED),
                                    ),
                                    title: Text("Add Beneficiary",
                                        style: poppinsSemiBold.copyWith(
                                            color: ColorResources
                                                .COLOR_DIM_GRAY)),
                                  ),
                                  Divider(
                                      height: 2,
                                      color: ColorResources
                                          .COLOR_WHITE_GRAY),
                                  new Text(
                                    _contact == null ? 'No contact selected.' : _contact.toString(),
                                  ),

                                ]),
                          ),
                        ],
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
