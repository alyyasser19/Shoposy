import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/Product.dart';
import '../../providers/Products.dart';
import '../../theme/Colors.dart';

class ModifyProduct extends StatefulWidget {
  static const String routeName = '/admin/edit';
  const ModifyProduct({Key?key}) : super(key: key);

  @override
  State<ModifyProduct> createState() => _ModifyProductState();
}

class _ModifyProductState extends State<ModifyProduct> {


  final _formKey = GlobalKey<FormState>();
  final _titleFocusNode = FocusNode();
  final _titleController = TextEditingController();
  final _priceFocusNode = FocusNode();
  final _priceController = TextEditingController();
  final _descriptionFocusNode = FocusNode();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  bool fetched = false;

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
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Products _products = Provider.of<Products>(context);
    final Product? product = ModalRoute.of(context)?.settings.arguments as Product?;
    if (product != null && !fetched) {
      _title = product.title;
      _titleController.text = _title;
      _description = product.description;
      _descriptionController.text = _description;
      _price = product.price;
      _priceController.text = _price.toString();
      _imageUrl = product.imageUrl;
      _imageUrlController.text = product.imageUrl;
      _category = Product.getCategory(product.category);
      setState(() {
        fetched = true;
      });
    }



    void _updateProduct() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
          _products.modifyProduct(
            Product(
              id: product!.id,
              title: _title,
              description: _description,
              price: _price,
              imageUrl: _imageUrl,
              category: _category,
            ),
          );
        Navigator.of(context).popAndPushNamed('/admin');
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
                      controller: _titleController,
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
                      controller: _priceController,
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
                      controller: _descriptionController,
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
                          _updateProduct();
                        },
                        child: const Text('Modify Product'),
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
