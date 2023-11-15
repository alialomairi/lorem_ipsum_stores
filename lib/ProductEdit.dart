import 'package:flutter/material.dart';
import 'package:lorem_ipsum_stores/Product.dart';

class ProductEdit extends StatefulWidget {
  const ProductEdit({super.key});

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtPrice = TextEditingController();
  final TextEditingController txtImage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Edit Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Image.asset('assets/images/logo.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: txtName,
                decoration: const InputDecoration(
                    label: Text('Name'),
                    border:  OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: txtDescription,
                decoration: const InputDecoration(
                    label: Text('Description'),
                    border:  OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: txtPrice,
                decoration:const  InputDecoration(
                    label: Text('Price'),
                    border:  OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: txtImage,
                decoration:const  InputDecoration(
                    label: Text('Image'),
                    border:  OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  var product = Product(
                      txtName.value.text,
                      txtDescription.value.text,
                      int.parse(txtPrice.value.text),
                      txtImage.value.text
                  );

                  Product.addProduct(product)
                      .then((value){

                    showDialog(
                      context: context,
                      builder: (builder)=>
                          AlertDialog(
                              title:const Text('Successful Save'),
                              content: const Text('The product wes saved successfully.'),
                              actions: [
                                TextButton(
                                    onPressed: ()=>Navigator.pop(context, 'OK'),
                                    child: const Text('OK')
                                )
                              ]
                          ),
                    );
                  });

                    },
                child: const Text('Register'),
              ) ,
            ),
          ],
        ),
      ),
    );
  }
}
