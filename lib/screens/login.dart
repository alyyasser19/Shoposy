import 'package:flutter/material.dart';
import 'package:flutter_shop/theme/Colors.dart';

class Login extends StatelessWidget {
  static const String routeName = '/login';
  const Login({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text('Shopsy', style: Theme.of(context).textTheme.headline3)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      Text('Your Number', style: Theme.of(context).textTheme.subtitle1),
                      Text(' One ', style: Theme.of(context).textTheme.subtitle1?.copyWith(color: shopsyRd)),
                      Text('electronics store for the most', style: Theme.of(context).textTheme.subtitle1),
                      Text(' niche ', style: Theme.of(context).textTheme.subtitle1?.copyWith(color: shopsyRd)),
                      Text('shopping experience', style: Theme.of(context).textTheme.subtitle1),
                    ],
                  )
                ],
              ),
              Expanded(
                child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(label: Text('Email'),hintText: 'Enter Your Email',border: OutlineInputBorder(), floatingLabelBehavior: FloatingLabelBehavior.always),

                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(label: Text('Email'),hintText: 'Enter Your Password',border: OutlineInputBorder(), floatingLabelBehavior: FloatingLabelBehavior.always),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                            ),
                            child: Text('LOGIN', style: Theme.of(context).textTheme.button),
                            onPressed: () {},
                          ),
                        )
                      ],
                    )
                ),
              ),
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
                  TextButton(onPressed: (){}, child: Text('Sign up', style: Theme.of(context).textTheme.subtitle2?.copyWith(color: shopsyRd,fontWeight: FontWeight.w400)), style: ButtonStyle(enableFeedback: false),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
