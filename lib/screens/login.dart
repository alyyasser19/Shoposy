import 'package:flutter/material.dart';
import 'package:flutter_shop/theme/Colors.dart';

class Login extends StatefulWidget {
  static const String routeName = '/login';
  const Login({Key?key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _password = '';
  var _email = '';

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login(){
    if(_form.currentState!.validate()){
      _form.currentState!.save();
      print(_email);
      print(_password);
    }}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.7;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:30.0, right: 30.0, top: 50.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: height  ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Shopsy', style: Theme.of(context).textTheme.headline3),
                SizedBox(
                  height: height * 0.06,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Text('Welcome To', style: Theme.of(context).textTheme.headline6),
                            Text(' Shopsy', style: Theme.of(context).textTheme.headline6?.copyWith(color: shopsyRd)),
                          ]
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Your number', style: Theme.of(context).textTheme.subtitle1),
                          Text(' One ', style: Theme.of(context).textTheme.subtitle1?.copyWith(color: shopsyRd)),
                          Text('electronics store for the most', style: Theme.of(context).textTheme.subtitle1),
                          Text(' niche ', style: Theme.of(context).textTheme.subtitle1?.copyWith(color: shopsyRd)),
                          Text('shopping experience', style: Theme.of(context).textTheme.subtitle1),
                        ],
                      )
                    ],
                  ),
                ),
                Form(
                  key: _form,
                    child: SizedBox(
                      height: height * 0.34,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(label: Text('Email'),hintText: 'Enter Your Email'),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            focusNode: _emailFocus,
                            controller: _emailController,
                            onSaved: (value) => _email = value!,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onFieldSubmitted: (term) {
                              FocusScope.of(context).requestFocus(_passwordFocusNode);
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(label: Text('Password'),hintText: 'Enter Your Password'),
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                             controller: _passwordController,
                             focusNode: _passwordFocusNode,
                            onSaved: (value) {
                              _password = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onFieldSubmitted: (term) {
                              _login();}
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                              ),
                              child: Text('LOGIN', style: Theme.of(context).textTheme.button),
                              onPressed: () {
                                _login();
                              },
                            ),
                          )
                        ],
                      ),
                    )
                ),
                SizedBox(
                  height: height * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          const Divider(
                            height: 15,
                            color: blackish,
                            thickness: 1,
                          ),
                          Positioned(
                              child: Center(child: Text('   Sign in with Google or Facebook  ', style: Theme.of(context).textTheme.headline6?.copyWith(color: offGrey, backgroundColor: offWhite, fontWeight: FontWeight.w400,fontSize: 11)))
                          )
                        ],
                      ),
                      ElevatedButton(onPressed: (){}, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/icons/mdi_google.png', height: 20, width: 20, fit: BoxFit.contain),
                          ),
                          Text('Sign in with Google', style: Theme.of(context).textTheme.button),
                        ]
                      )),
                      ElevatedButton(onPressed: (){}, child: Padding(
                        padding: const EdgeInsets.only(left:15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/icons/mdi_facebook.png', height: 20, width: 20, fit: BoxFit.contain),
                            ),
                            Text('Sign in with Facebook', style: Theme.of(context).textTheme.button),
                          ]
                        ),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?', style: Theme.of(context).textTheme.subtitle2?.copyWith(color: offGrey,fontWeight: FontWeight.w400)),
                          TextButton(onPressed: (){
                            Navigator.pushNamed(context, '/sign_up');
                          }, child: Text('Sign up', style: Theme.of(context).textTheme.subtitle2?.copyWith(color: shopsyRd,fontWeight: FontWeight.w400)), style: const ButtonStyle(enableFeedback: false),),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
