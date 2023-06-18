


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:quantity_input/quantity_input.dart';

// import '../../../Downloads/Ecommerce_Latest-master/Ecommerce_Latest-master/lib/ar_page.dart';
// import '../../../Downloads/Ecommerce_Latest-master/Ecommerce_Latest-master/lib/check_out.dart';


class ProductDetail extends StatefulWidget
{
  final String id ,description, imgUrl,title,price;

  ProductDetail({super.key,required this.id, required this.description, required this.imgUrl,required this.title,required this.price});



  @override
  State<ProductDetail> createState() => _ProductDetailState();
}



class _ProductDetailState extends State<ProductDetail>{


  int simpleIntInput = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ProductDetail"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Image.network(widget.imgUrl,
                height: 400,
                width: 300,
              ),
              SizedBox(height: 30,),
              Text("${widget.title}",

                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold

                ),

              ),

              SizedBox(height: 20,),

              Text("Price : ${widget.price}",

                style: TextStyle(
                    fontSize: 20
                ),

              ),

                  SizedBox(height: 20,),



                  ////////AR////////////////////////////////







              ////////////////////////////////////////




                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Quantity : ",
                        style: TextStyle(
                          fontSize: 20
                        ),

                      ),
                      QuantityInput(

                        minValue: 1,

                          value: simpleIntInput,
                          onChanged: (value) => setState(() => simpleIntInput = int.parse(value.replaceAll(',', '')))
                      ),
                    ],
                  ),





              SizedBox(height: 30,),

              Text("Product Description :",
              style: TextStyle(
                fontSize: 20
              ),
              ),

              SizedBox(height: 15,),

              Text("${widget.description}",
              style: TextStyle(
                fontSize: 15
              ),
              ),



              SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [



                  ElevatedButton(

                      onPressed: (){





                      },
                      child: Text("Add to Cart")
                  ),

                ],
              ),


              SizedBox(height: 50,)



            ],
          ),
        )
      ),
    );
  }

}