import 'package:flutter/material.dart';
import '../../providers/auth.dart';
import 'package:provider/provider.dart';
import './login_screen.dart';
import '../../widgets/loginWidgets.dart' as loginWidgets;
import '../../services/http_exception.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
//  final GlobalKey<FormState> _formKey = GlobalKey();
  final _formKey = GlobalKey<FormState>(); // GlobalKey<FormState>();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Map<String, String> _authData = {
    'email': '',
    'password': '',
    'firstname': '',
    'lastname': '',
    'school': '',
  };

  String validator(String value, String type) {
    if (value.isEmpty) {
      return 'Can\'t be empty';
    }

    switch (type) {
      case 'password':
        if (value.length < 5) {
          return 'Password too small';
        }
        break;
      case 'email':
        if (!value.contains('@') || !value.contains('.') || value.length < 10) {
          return 'Invalid email';
        }
        break;
      case 'confirmpassword':
        if (value != _passwordController.text) {
          return 'Passwords do not match!';
        }
        break;
      default:
        return null;
    }
  }

  Widget _entryField(String title, String type, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              onSaved: (value) {
                _authData[type] = value;
              },
              controller: type == 'password' ? _passwordController : null,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
              validator: (value) {
                return validator(value, type);
              })
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        print('lee');
        _submit();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: Text(
          'Register Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();

    try {
      // Sign user up
      await Provider.of<Auth>(context, listen: false)
          .signup(_authData, context);
    } on HttpException catch (error) {
      String e =
          HttpException(message: error.toString()).errorAuthentification(error);
      HttpException().showErrorDialog(e, context);
      return;
    } catch (err) {
      const e = 'Could not authenticate you. Please try again later.';
      HttpException().showErrorDialog(e, context);
      return;
    }
  }

  Widget _alreadyAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    var _isLoading = false;
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _entryField("First Name", 'firstname'),
          _entryField("Last Name", 'lastname'),
          _entryField("Username", 'username'),
          _entryField("School", 'school'),
          _entryField("Email", 'email'),
          _entryField("Password", 'password', isPassword: true),
          _entryField("Confirm password", 'confirmpassword', isPassword: true),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: Text('Nooo'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    loginWidgets.Title(Colors.orange),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .14),
                    _alreadyAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: loginWidgets.BackButton()),
          ],
        ),
      ),
    );
  }
}
