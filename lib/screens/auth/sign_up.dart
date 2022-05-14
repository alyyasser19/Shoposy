import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

import '../../providers/Auth.dart';
import '../../theme/Colors.dart';

class SignUp extends StatefulWidget {
  static const String routeName = '/sign_up';
  const SignUp({Key?key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _surnameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _countryFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _countryController = TextEditingController();
  var _password = '';
  var _email = '';
  var _name = '';
  var _surname = '';
  PhoneNumber _phone = PhoneNumber(dialCode: '+20');
  var _country = '';

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _nameFocusNode.dispose();
    _surnameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _countryFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _phoneController.dispose();
    _countryController.dispose();
    super.dispose();
  }
  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }
  @override
  Widget build(BuildContext context) {
    final Auth _auth= Provider.of<Auth>(context,listen: false);
    double height = MediaQuery
        .of(context)
        .size
        .height * 0.8;

    Future<void> _register() async {
      if (_form.currentState!.validate()) {
        _form.currentState!.save();
        var response = await _auth.signup(email: _email, password: _password, name: _name, surname: _surname, phone: _phone.toString(), country: _country);
        if(response['success'] != null){
          Navigator.of(context).pop();
        }
        else
        {
          print(response['error']['message']);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Shopsy', style: Theme
                    .of(context)
                    .textTheme
                    .headline3),
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
                            children: [
                              Text('Create a new', style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6),
                              Text(' Account!', style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: shopsyRd)),
                            ]
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Please fill the following information to create a new account', style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1),
                        ],
                      )
                    ],
                  ),
                ),
                Form(
                    key: _form,
                    child: SizedBox(
                      height: height * 0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                              decoration: const InputDecoration(label: Text(
                                  'First Name'), hintText: 'Enter Your First Name'),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              controller: _nameController,
                              focusNode: _nameFocusNode,
                              onSaved: (value) {
                                _name = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onFieldSubmitted: (term) {
                                FocusScope.of(context).requestFocus(
                                    _surnameFocusNode);
                              }
                          ),
                          TextFormField(
                              decoration: const InputDecoration(label: Text(
                                  'Last Name'), hintText: 'Enter Your Last Name'),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              controller: _surnameController,
                              focusNode: _surnameFocusNode,
                              onSaved: (value) {
                                _surname = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onFieldSubmitted: (term) {
                                FocusScope.of(context).requestFocus(
                                    _emailFocus);
                              }
                          ),
                          TextFormField(
                            decoration: const InputDecoration(label: Text(
                                'Email'), hintText: 'Enter Your Email'),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            focusNode: _emailFocus,
                            controller: _emailController,
                            onSaved: (value) => _email = value!,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              if (!validateEmail(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            onFieldSubmitted: (term) {
                              FocusScope.of(context).requestFocus(
                                  _passwordFocusNode);
                            },
                          ),
                          TextFormField(
                              decoration: const InputDecoration(label: Text(
                                  'Password'), hintText: 'Enter Your Password'),
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
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                              onFieldSubmitted: (term) {
                                FocusScope.of(context).requestFocus(
                                    _confirmPasswordFocusNode);
                              }
                          ),
                          TextFormField(
                              decoration: const InputDecoration(label: Text(
                                  'Confirm Password'), hintText: 'Confirm Your Password'),
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              controller: _confirmPasswordController,
                              focusNode: _confirmPasswordFocusNode,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                if(value != _passwordController.text) {
                                  return 'Password does not match';
                                }
                                return null;
                              },
                              onFieldSubmitted: (term) {
                                FocusScope.of(context).requestFocus(
                                    _phoneFocusNode);
                              }
                          ),
                          InternationalPhoneNumberInput(
                            inputDecoration: const InputDecoration(label: Text('Phone Number')),
                            initialValue: PhoneNumber(isoCode: 'EG'),
                            onInputChanged: (value) {
                              _phone = value;
                            },
                            focusNode: _phoneFocusNode,
                            textFieldController: _phoneController,
                            onSaved: (value) {
                              _phone = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onFieldSubmitted: (term) {
                              FocusScope.of(context).unfocus();
                            },
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                          ),
                          TextFormField(
                              decoration: const InputDecoration(label: Text(
                                  'Country'), hintText: 'Choose your country', suffixIcon: Icon(Icons.arrow_drop_down, color:shopsyRd)),
                              keyboardType: TextInputType.none,
                              textInputAction: TextInputAction.done,
                              controller: _countryController,
                              focusNode: _countryFocusNode,
                              onSaved: (value) {
                                _country = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                  //return 'Please enter your country';
                                }
                                return null;
                              },
                            onTap: (){
                                showCountryPicker(context: context,onClosed: (){FocusScope.of(context).focusedChild!.unfocus();}, onSelect: (country) {
                                  setState(() {
                                    _country = country.name;
                                    _countryController.text = country.name;
                                  });
                                });
                            },
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                              ),
                              child: Text('Create Account', style: Theme
                                  .of(context)
                                  .textTheme
                                  .button),
                              onPressed: () {
                                _register();
                              },
                            ),
                          )
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}