import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:trend/screens/app/root.dart';
import 'package:trend/screens/sign_up/sign_up.dart';
import 'package:trend/services/auth/auth_provider.dart';
import 'package:trend/services/auth/core/auth_result.dart';
import 'package:trend/services/auth/valudator.dart';
import 'package:trend/theme/app_colors.dart';
import 'package:trend/utils/locator.dart';
import 'package:trend/widgets/custome_button.dart';

class SignIn extends StatefulWidget {
  static const route = 'signin';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.darkTextColor),
        actions: [
          FlatButton(
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SignUp(),
              ));
            },
            child: Text(
              'Sign up',
              style: TextStyle(color: AppColors.darkTextColor),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      'Sign in',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: CircleAvatar(
                      foregroundColor: AppColors.cardColor,
                      backgroundColor: AppColors.cardColor,
                      radius: MediaQuery.of(context).size.height * 0.08,
                      child: Icon(Feather.user,
                          color: AppColors.iconActiveColor,
                          size: MediaQuery.of(context).size.height * 0.05),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27, vertical: 12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 18,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            spreadRadius: 1,
                            offset: Offset(0, 3)),
                      ],
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (email) =>
                          getIt<Valudator>().emailValudator(email),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27, vertical: 12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 18,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _passwordController,
                            validator: (password) =>
                                getIt<Valudator>().passwordValudator(password),
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Password'),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget?',
                            style:
                                Theme.of(context).textTheme.overline.copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27, vertical: 12),
                  child: SignButton(
                    onTap: _login,
                    text: 'Sign in',
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27, vertical: 12),
                  child: SignButton(
                    onTap: () {
                      var auth =
                          Provider.of<AuthServices>(context, listen: false);
                      auth.signInWithGoogle();
                    },
                    text: 'Google',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _login() async {
    final formState = _formKey.currentState;
    var auth = Provider.of<AuthServices>(context, listen: false);
    if (formState.validate()) {
      formState.save();
      showLoading();
      try {
        var res = auth.signInWithEmailAndPassword(
            _emailController.text, _passwordController.text);
        if (res == AuthResult.autherized()) {
          print('suscccscsscscc');
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Center(
                child: Text(
                  'Lo success gIn',
                ),
              ),
              content: Text('u have sign in successufuly'),
              contentTextStyle: TextStyle(color: Colors.black),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrendApp(),
                          ));
                    },
                    child: Text('done'))
              ],
            ),
          );
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Center(
              child: Text(
                'Error',
              ),
            ),
            content: Text('Oh no!🤦‍♂️ can\'t login , please try again later'),
            contentTextStyle: TextStyle(color: Colors.black),
          ),
        );
        Navigator.pop(context);
      }
    }
  }

  showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      // useSafeArea: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).backgroundColor,
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          ),
        );
      },
    );
  }
}
