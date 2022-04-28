import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/Product.dart';
import 'package:flutter_shop/providers/Products.dart';
import 'package:provider/provider.dart';
import '../../theme/Colors.dart';



class AddProduct extends StatefulWidget {
  static const routeName = '/admin/add-product';
  const AddProduct({Key?key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  final _titleFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();

  String _title = '';
  String _description = '';
  double _price =  0.0;
  String _imageUrl = '';
  Categories _category = Categories.mouse;


  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {
        _imageUrl = _imageUrlController.text;
      });
    }
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _imageUrlFocusNode.dispose();
    _imageUrlController.dispose();
    _titleFocusNode.dispose();
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Products _products = Provider.of<Products>(context, listen: false);

    void _addProduct() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        _products.addProduct(Product(id: DateTime.now().toString(), title: _title, description: _description, imageUrl: _imageUrl, price: _price, category: _category)).catchError((error) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('An error occurred!'),
              content: Text(error.toString()),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('Okay'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ),
          );
        });
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("add Product"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: offWhite,
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: height * 0.77,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  _imageUrl==''?
                      Container(
                        height: height*0.3,
                        width: width,
                        child: const Center(
                          child: Text("Image Preview",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w200),),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: offGrey,width: 0.5),
                        ),
                      )
                          : Image.network(
                    _imageUrl, height: MediaQuery.of(context).size.height*0.3, width: double.infinity, fit: BoxFit.contain,
                  errorBuilder: (context, url, error) {
                    return Container(
                      height: height*0.3,
                      width: width,
                      child: const Center(
                        child: Text("Invalid Image",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w200),),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: offGrey,width: 0.5),
                      ),
                    );
                  },
                  ),
                      TextFormField(
                      decoration: const InputDecoration(label: Text('Title'),hintText: 'Enter The Product Title'),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      focusNode: _titleFocusNode,
                      onSaved: (value) =>  _title = value!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onFieldSubmitted: (term) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(label: Text('Price'),hintText: 'Enter The Product Price'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      focusNode: _priceFocusNode,
                      onSaved: (value) =>  _price = double.parse(value!),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        try{
                          double.parse(value);
                        }catch(e){
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                      onFieldSubmitted: (term) {
                        FocusScope.of(context).requestFocus(_imageUrlFocusNode);
                      },
                    ),
                      TextFormField(
                        decoration: const InputDecoration(label: Text('Image Url'),hintText: 'Enter The Product Image Url'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.next,
                        focusNode: _imageUrlFocusNode,
                        controller: _imageUrlController,
                        onSaved: (value) =>  _imageUrl = value!,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onFieldSubmitted: (term) {
                          FocusScope.of(context).requestFocus(_descriptionFocusNode);
                        },
                      ),
                    TextFormField(
                      decoration: const InputDecoration(label: Text('Description'),hintText: 'Enter The Product Description'),
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      focusNode: _descriptionFocusNode,
                      maxLines: 3,
                      onSaved: (value) =>  _description = value!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                              _addProduct();
                          },
                          child: const Text('Add Product'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}