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
import 'package:wallet_ui_kit/view/screens/beneficiaries.dart';
/*class SettingScreen extends StatelessWidget {
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
                CustomAppBar(title: Strings.SETTING, color: ColorResources.COLOR_WHITE),

                // Upper Card
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(30, 50, 30, 30),
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  decoration: BoxDecoration(
                    color: ColorResources.COLOR_WHITE,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(children: [
                   /* Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(color: ColorResources.COLOR_PRIMARY, shape: BoxShape.circle),
                      child: Image.asset(
                        'assets/images/person3.png',
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),*/
                    Stack(
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.1),
                                        offset: Offset(0, 10))
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: (_image != null)
                                        ? FileImage(_image)
                                        : NetworkImage(
                                            ds["imageUrl"].toString()),
                                  )),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () async {
                                    try {
                                      var image = await ImagePicker.pickImage(
                                          source: ImageSource.gallery);
                                      setState(() {
                                        _image = image;
                                      });
                                    } catch (e) {}
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 4,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                      color: Colors.pink,
                                    ),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                    SizedBox(height: 10),
                    Text(Strings.NAME, style: poppinsBold),
                    Text(Strings.EMAIL,
                        style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_DIM_GRAY, fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL)),
                    Divider(height: 15, color: ColorResources.COLOR_DIM_GRAY),
                    Text(Strings.USD266,
                        style: poppinsBold.copyWith(color: ColorResources.COLOR_CARIBBEAN_GREEN, fontSize: Dimensions.FONT_SIZE_LARGE)),
                  ]),
                ),

                Expanded(
                  child: ListView(physics: BouncingScrollPhysics(), padding: EdgeInsets.all(10), children: [
                    // Buttons
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        child: Icon(Icons.home, color: ColorResources.COLOR_MEDIUM_VIOLET_RED),
                      ),
                      title: Text(Strings.HOME_DASHBOARD, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_DIM_GRAY)),
                    ),
                    Divider(height: 2, color: ColorResources.COLOR_WHITE_GRAY),

                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        child: Icon(Icons.picture_as_pdf, color: ColorResources.COLOR_MEDIUM_VIOLET_RED),
                      ),
                      title: Text(Strings.STATEMENT, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_DIM_GRAY)),
                    ),
                    Divider(height: 2, color: ColorResources.COLOR_WHITE_GRAY),

                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        child: Icon(Icons.category, color: ColorResources.COLOR_MEDIUM_VIOLET_RED),
                      ),
                      title: Text(Strings.COUPON, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_DIM_GRAY)),
                    ),
                    Divider(height: 2, color: ColorResources.COLOR_WHITE_GRAY),

                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        child: Icon(Icons.whatshot, color: ColorResources.COLOR_MEDIUM_VIOLET_RED),
                      ),
                      title: Text(Strings.PREFERENCE, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_DIM_GRAY)),
                    ),
                    Divider(height: 2, color: ColorResources.COLOR_WHITE_GRAY),

                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        child: Icon(Icons.language, color: ColorResources.COLOR_MEDIUM_VIOLET_RED),
                      ),
                      title: Text(Strings.SETTING, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_DIM_GRAY)),
                    ),
                    Divider(height: 2, color: ColorResources.COLOR_WHITE_GRAY),

                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        child: Icon(Icons.person_add, color: ColorResources.COLOR_MEDIUM_VIOLET_RED),
                      ),
                      title: Text(Strings.REFER_A_FRIEND, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_DIM_GRAY)),
                    ),
                    Divider(height: 2, color: ColorResources.COLOR_WHITE_GRAY),

                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        child: Icon(Icons.local_library, color: ColorResources.COLOR_MEDIUM_VIOLET_RED),
                      ),
                      title: Text(Strings.SUPPORT, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_DIM_GRAY)),
                    ),
                    Divider(height: 2, color: ColorResources.COLOR_WHITE_GRAY),

                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        child: Icon(Icons.exit_to_app, color: ColorResources.COLOR_MEDIUM_VIOLET_RED),
                      ),
                      title: Text(Strings.LOG_OUT, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_DIM_GRAY)),
                    ),
                    Divider(height: 2, color: ColorResources.COLOR_WHITE_GRAY),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
                                    title: Strings.SETTING,
                                    color: ColorResources.COLOR_WHITE),

                                // Upper Card
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.fromLTRB(30, 50, 30, 30),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.PADDING_SIZE_LARGE,
                                      vertical: 15),
                                  decoration: BoxDecoration(
                                    color: ColorResources.COLOR_WHITE,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(children: [
                                    /* Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(color: ColorResources.COLOR_PRIMARY, shape: BoxShape.circle),
                            child: Image.asset(
                              'assets/images/person3.png',
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),*/
                                    Stack(
                                      children: [
                                        Container(
                                          width: 65,
                                          height: 65,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 4,
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor),
                                              boxShadow: [
                                                BoxShadow(
                                                    spreadRadius: 2,
                                                    blurRadius: 10,
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    offset: Offset(0, 10))
                                              ],
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: (_image != null)
                                                    ? FileImage(_image)
                                                    : NetworkImage(
                                                        ds["imageUrl"]
                                                            .toString()),
                                              )),
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: GestureDetector(
                                              onTap: () async {
                                                try {
                                                  var image = await ImagePicker
                                                      .pickImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  setState(() {
                                                    _image = image;
                                                  });
                                                } catch (e) {}
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    width: 4,
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor,
                                                  ),
                                                  color: Colors.pink,
                                                ),
                                                child: Icon(
                                                  Icons.edit,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                        ds["fnames"].toString() +
                                            " " +
                                            ds["sname"].toString(),
                                        style: poppinsBold),
                                    Text(ds["email"].toString(),
                                        style: poppinsSemiBold.copyWith(
                                            color:
                                                ColorResources.COLOR_DIM_GRAY,
                                            fontSize: Dimensions
                                                .FONT_SIZE_EXTRA_SMALL)),
                                    Divider(
                                        height: 15,
                                        color: ColorResources.COLOR_DIM_GRAY),
                                    Container(
                                      width: double.infinity,
                                      height: 40,
                                      margin:
                                          EdgeInsets.only(left: 36, right: 36),
                                      child: FlatButton(
                                        child: Text(
                                          "Save",
                                          style: poppinsRegular.copyWith(
                                              color: ColorResources
                                                  .COLOR_DIM_GRAY),
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            loadingPage = true;
                                          });
                                          if (_image != null) {
                                            await uploadHouseImage();
                                            final CollectionReference
                                                allergyCollection = Firestore
                                                    .instance
                                                    .collection('users');
                                            await Future.delayed(
                                                Duration(seconds: 10));
                                            print(
                                                "link1 = " + _uploadedFileURL);
                                            await allergyCollection
                                                .document(loggedInUser)
                                                .updateData({
                                              'email': ds["email"].toString(),
                                              'fnames': ds["fnames"].toString(),
                                              'sname': ds["sname"].toString(),
                                              'phoneNumber':
                                                  ds["phoneNumber"].toString(),
                                              'houseAddress':
                                                  ds["houseAddress"].toString(),
                                              'imageUrl': _uploadedFileURL,
                                              'idnumber':
                                                  ds["idnumber"].toString(),
                                            });
                                          } else {
                                            _uploadedFileURL =
                                                ds["imageUrl"].toString();
                                            final CollectionReference
                                                allergyCollection = Firestore
                                                    .instance
                                                    .collection('users');
                                            await allergyCollection
                                                .document(loggedInUser)
                                                .updateData({
                                              'email': ds["email"].toString(),
                                              'fnames': ds["fnames"].toString(),
                                              'sname': ds["sname"].toString(),
                                              'phoneNumber':
                                                  ds["phoneNumber"].toString(),
                                              'houseAddress':
                                                  ds["houseAddress"].toString(),
                                              'imageUrl': _uploadedFileURL,
                                              'idnumber':
                                                  ds["idnumber"].toString(),
                                            });
                                          }

                                          /* final CollectionReference allergyCollection =
                                        Firestore.instance.collection('users');
                                    await allergyCollection
                                        .document(loggedInUser)
                                        .updateData({
                                      'email': ds["email"].toString(),
                                      'fnames': ds["fnames"].toString(),
                                      'sname': ds["sname"].toString(),
                                      'phoneNumber': ds["phoneNumber"].toString(),
                                      'houseAddress':
                                          ds["houseAddress"].toString(),
                                      'imageUrl': _uploadedFileURL,
                                      'idnumber': ds["idnumber"].toString(),
                                    });*/
                                          //print("link = " + _uploadedFileURL);
                                          setState(() {
                                            loadingPage = false;
                                          });
                                        },
                                      ),
                                    ),
                                  ]),
                                ),

                                Expanded(
                                  child: ListView(
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.all(10),
                                      children: [
                                        // Buttons
                                      /*  ListTile(
                                          onTap: () {},
                                          leading: CircleAvatar(
                                            child: Icon(Icons.home,
                                                color: ColorResources
                                                    .COLOR_MEDIUM_VIOLET_RED),
                                          ),
                                          title: Text(Strings.HOME_DASHBOARD,
                                              style: poppinsSemiBold.copyWith(
                                                  color: ColorResources
                                                      .COLOR_DIM_GRAY)),
                                        ),
                                        Divider(
                                            height: 2,
                                            color: ColorResources
                                                .COLOR_WHITE_GRAY), */

                                        ListTile(
                                          onTap: () {},
                                          leading: CircleAvatar(
                                            child: Icon(Icons.picture_as_pdf,
                                                color: ColorResources
                                                    .COLOR_MEDIUM_VIOLET_RED),
                                          ),
                                          title: Text("History",
                                              style: poppinsSemiBold.copyWith(
                                                  color: ColorResources
                                                      .COLOR_DIM_GRAY)),
                                        ),
                                        Divider(
                                            height: 2,
                                            color: ColorResources
                                                .COLOR_WHITE_GRAY),

                                        ListTile(
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => BenefciariesScreen()));
                                          },
                                          leading: CircleAvatar(
                                            child: Icon(Icons.people_outlined,
                                                color: ColorResources
                                                    .COLOR_MEDIUM_VIOLET_RED),
                                          ),
                                          title: Text("Beneficiaries",
                                              style: poppinsSemiBold.copyWith(
                                                  color: ColorResources
                                                      .COLOR_DIM_GRAY)),
                                        ),
                                        Divider(
                                            height: 2,
                                            color: ColorResources
                                                .COLOR_WHITE_GRAY),

                                        ListTile(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        TermsScreen());
                                          },
                                          leading: CircleAvatar(
                                            child: Icon(Icons.category,
                                                color: ColorResources
                                                    .COLOR_MEDIUM_VIOLET_RED),
                                          ),
                                          title: Text("Terms and Conditions",
                                              style: poppinsSemiBold.copyWith(
                                                  color: ColorResources
                                                      .COLOR_DIM_GRAY)),
                                        ),
                                        Divider(
                                            height: 2,
                                            color: ColorResources
                                                .COLOR_WHITE_GRAY),

                                        /*  ListTile(
                                    onTap: () {},
                                    leading: CircleAvatar(
                                      child: Icon(Icons.whatshot,
                                          color: ColorResources
                                              .COLOR_MEDIUM_VIOLET_RED),
                                    ),
                                    title: Text(Strings.PREFERENCE,
                                        style: poppinsSemiBold.copyWith(
                                            color:
                                                ColorResources.COLOR_DIM_GRAY)),
                                  ),
                                  Divider(
                                      height: 2,
                                      color: ColorResources.COLOR_WHITE_GRAY),*/

                                        ListTile(
                                          onTap: () {},
                                          leading: CircleAvatar(
                                            child: Icon(Icons.language,
                                                color: ColorResources
                                                    .COLOR_MEDIUM_VIOLET_RED),
                                          ),
                                          title: Text(Strings.SETTING,
                                              style: poppinsSemiBold.copyWith(
                                                  color: ColorResources
                                                      .COLOR_DIM_GRAY)),
                                        ),
                                        Divider(
                                            height: 2,
                                            color: ColorResources
                                                .COLOR_WHITE_GRAY),

                                     /*   ListTile(
                                          onTap: () {},
                                          leading: CircleAvatar(
                                            child: Icon(Icons.person_add,
                                                color: ColorResources
                                                    .COLOR_MEDIUM_VIOLET_RED),
                                          ),
                                          title: Text(Strings.REFER_A_FRIEND,
                                              style: poppinsSemiBold.copyWith(
                                                  color: ColorResources
                                                      .COLOR_DIM_GRAY)),
                                        ),
                                        Divider(
                                            height: 2,
                                            color: ColorResources
                                                .COLOR_WHITE_GRAY),
                                                */



                                        ListTile(
                                          onTap: () {},
                                          leading: CircleAvatar(
                                            child: Icon(Icons.local_library,
                                                color: ColorResources
                                                    .COLOR_MEDIUM_VIOLET_RED),
                                          ),
                                          title: Text("Open Email Support Page",
                                              style: poppinsSemiBold.copyWith(
                                                  color: ColorResources
                                                      .COLOR_DIM_GRAY)),
                                        ),
                                        Divider(
                                            height: 2,
                                            color: ColorResources
                                                .COLOR_WHITE_GRAY),
                                    ListTile(
                                          onTap: () {},
                                          leading: CircleAvatar(
                                            child: Icon(Icons.exit_to_app,
                                                color: ColorResources
                                                    .COLOR_MEDIUM_VIOLET_RED),
                                          ),
                                          title: Text(Strings.LOG_OUT,
                                              style: poppinsSemiBold.copyWith(
                                                  color: ColorResources
                                                      .COLOR_DIM_GRAY)),
                                        ),
                                        Divider(
                                            height: 2,
                                            color: ColorResources
                                                .COLOR_WHITE_GRAY),
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
