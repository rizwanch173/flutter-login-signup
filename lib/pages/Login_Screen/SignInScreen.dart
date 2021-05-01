import 'package:flutter/material.dart';
import 'package:new_app/pages/Forget_Screen/Forget_Password_Screen.dart';
import 'package:new_app/pages/Singup_Screen/SignupScreen.dart';
import 'package:new_app/theme/theme.dart';
import 'package:new_app/widgets/customLoader.dart';
import 'package:new_app/widgets/customWidgets.dart';
import 'package:new_app/widgets/title_text.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  final VoidCallback loginCallback;

  const SignInScreen({Key key, this.loginCallback}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  CustomLoader loader;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    loader = CustomLoader();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 150),
            _entryFieldEmail(),
            _entryFieldPassword(),
            _emailLoginButton(context),
            SizedBox(height: 20),
            _labelButton('Forget password?', onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgetPasswordScreen(),
                ),
              );
            }),
            SizedBox(height: 100),
            _noAccountButton(),
          ],
        ),
      ),
    );
  }

  Widget _entryFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        obscureText: false,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          labelText: "Email",
          labelStyle: TextStyle(color: TwitterColor.black),
          hintText: "someone@gmail.com",
          hintStyle: TextStyle(color: Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.email_outlined,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: TwitterColor.Orange)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: TwitterColor.Orange)),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }

  Widget _entryFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: _passwordController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
            color: TwitterColor.black,
          ),
          hintText: "******",
          hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: Icon(
            Icons.lock_outline,
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

  Widget _labelButton(String title, {Function onPressed}) {
    return FlatButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      splashColor: Colors.grey.shade200,
      child: Text(
        title,
        style:
            TextStyle(color: TwitterColor.Orange, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _emailLoginButton(BuildContext context) {
    return Container(
      width: fullWidth(context),
      margin: EdgeInsets.symmetric(vertical: 35),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: TwitterColor.DefultYellow,
        onPressed: () {
          _emailLogin();
        },
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: TitleText('Submit', color: Colors.black),
      ),
    );
  }

  Widget _noAccountButton() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        TitleText(
          "Don't have an account ?",
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
        _labelButton('Sign up', onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpScreen(),
            ),
          );
        }),
      ],
    );
  }

  void _emailLogin() {
    loader.showLoader(context);
    print("object");
    if (false) {
    } else {
      loader.hideLoader();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: customText('Sign in',
            context: context, style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }
}
