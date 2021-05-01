import 'package:flutter/material.dart';
import 'package:new_app/theme/theme.dart';
import 'package:new_app/widgets/customWidgets.dart';

class ForgetPasswordScreen extends StatefulWidget {
  //final VoidCallback loginCallback;

  //const ForgetPasswordScreen({Key key, this.loginCallback}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordScreen> {
  FocusNode _focusNode;
  TextEditingController _emailController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _focusNode = FocusNode();
    _emailController = TextEditingController();
    _emailController.text = '';
    _focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Widget _body(BuildContext context) {
    return Container(
        height: fullHeight(context),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _label(),
            SizedBox(
              height: 40,
            ),
            _entryField(),
            // SizedBox(height: 10,),
            _submitButton(context),
          ],
        ));
  }

  Widget _entryField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(color: TwitterColor.black),
          hintText: "someone@gmail.com",
          hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: Icon(
            Icons.email_outlined,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: TwitterColor.Orange)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: TwitterColor.Orange)),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: TwitterColor.DefultYellow,
          onPressed: () {},
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text('Submit', style: TextStyle(color: Colors.black)),
        ));
  }

  Widget _label() {
    return Container(
        child: Column(
      children: <Widget>[
        customText('Forget Password',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: customText(
              'Enter your email address below to receive password reset instruction',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
              textAlign: TextAlign.center),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: customText('Forget Password',
            context: context, style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }
}
