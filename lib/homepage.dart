


import 'dart:convert';

import 'package:get/get.dart';
import 'package:pioneer3/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


//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


class Home extends StatefulWidget
{
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {








  //Map <String, dynamic>? apiMap;
  RxList<dynamic>? list=[].obs;

  Future getUserData() async
  {
    var response=await http.get(
        Uri.parse('https://fakestoreapi.com/products')
    );


      list?.value = jsonDecode(response.body);



    //print(list?.length);

  }


  @override
  Widget build(BuildContext context) {

    getUserData();
    //filter(Category);

    // var response=await http.get(
    //     Uri.parse('https://fakestoreapi.com/products')
    // );
    // list = jsonDecode(response.body);

    // TODO: implement build
    return list!=null? MaterialApp(
      home: Obx(()=> Scaffold(

          appBar: AppBar(

              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Home"),
                  InkWell(

                    onTap: (){



                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return CartPage();
                      //     },
                      //   ),
                      // );


                    },


                    child: Icon(Icons.shopping_cart),
                  )

                ],
              )

          ),

          body: SingleChildScrollView(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //image_carousel,









                Card(
                  child:
                  ListView.builder(
                      itemCount: list?.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (_HomeState, index){



                        return ListTile(
                          leading: Image.network(list![index]['image'].toString()),
                          title: Text( list![index]['title'].toString()),//list![index]['actor']['id'].toString()),
                          subtitle: Text("Price :"+"${list![index]['price'].toString()}"),

                          onTap: (){


                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductDetail(
                                      description: "${list![index]['description'].toString()}",
                                      price: "${list![index]['price'].toString()}",
                                      title: "${list![index]['title'].toString()}",
                                      imgUrl: "${list![index]['image'].toString()}",
                                      id:"${list![index]['id'].toString()}"

                                  );
                                },
                              ),
                            );


                          },

                        );

                        //Text(list![index]['id']);
                      }
                  ),
                )
              ],
            ),),


          // drawer: new Drawer(
          //   child: ListView(
          //     children: [
          //       new UserAccountsDrawerHeader(
          //         accountName: Text("Name"),
          //         accountEmail: Text("Email"),
          //         currentAccountPicture: GestureDetector(
          //             child: InkWell(
          //               onTap: (){
          //                 // getImage();
          //               },
          //               child: CircleAvatar(
          //                 child: img!=null?Image.file(img!,width:50,height: 50,):Icon(Icons.person,size: 50,),
          //                 radius: 30,
          //
          //
          //               ),
          //             )
          //
          //         ),
          //         decoration: new BoxDecoration(
          //             color: Colors.pink
          //         ),
          //
          //
          //
          //       ),
          //
          //       ListTile(
          //         title: Text("home"),
          //         leading: Icon(Icons.home),
          //         onTap: (){
          //
          //         },
          //       ),
          //
          //
          //       ListTile(
          //         title: Text("My Account"),
          //         leading: Icon(Icons.person),
          //         onTap: (){
          //
          //         },
          //       ),
          //
          //
          //       ListTile(
          //         title: Text("My Orders"),
          //         leading: Icon(Icons.shopping_basket_rounded),
          //         onTap: (){
          //
          //         },
          //       ),
          //
          //
          //       ListTile(
          //         title: Text("Catagories"),
          //         leading: Icon(Icons.dashboard),
          //         onTap: (){
          //
          //         },
          //       ),
          //
          //
          //       ListTile(
          //         title: Text("Favorites"),
          //         leading: Icon(Icons.favorite),
          //         onTap: (){
          //
          //         },
          //       ),
          //
          //
          //
          //       // ListTile(
          //       //   title: Text("Favorites"),
          //       //   leading: Icon(Icons.favorite),
          //       //   onTap: (){
          //       //
          //       //   },
          //       // ),
          //
          //       Divider(),
          //
          //       ListTile(
          //         title: Text("Settings"),
          //         leading: Icon(Icons.settings),
          //         onTap: (){
          //
          //         },
          //       ),
          //
          //
          //       ListTile(
          //         title: Text("About"),
          //         leading: Icon(Icons.help),
          //         onTap: (){
          //
          //         },
          //       ),
          //
          //       ListTile(
          //         title: Text("Share"),
          //         leading: Icon(Icons.share),
          //         onTap: (){
          //
          //         },
          //       ),
          //
          //
          //
          //
          //
          //
          //
          //
          //     ],
          //   ),
          // ),


        ),),












    ):Scaffold(
        body: Center(
          child: Text("Loading-----------",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),


          ),
        )
    );
  }





// @override
// void initState() {
//
//   getUserData();
//
//   super.initState();
//
//
// }
}
