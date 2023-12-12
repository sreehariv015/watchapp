import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:watchapp/screens/main_page.dart';

import '../../screens/home_page.dart';
class ProductDetails1 extends StatefulWidget {
  const ProductDetails1({super.key});

  @override
  State<ProductDetails1> createState() => _ProductDetails1State();
}

class _ProductDetails1State extends State<ProductDetails1> {
  CarouselController carouselController = CarouselController();
  int currentindex=0;
  bool isFavorite = false;
  final List<String> watchImages = [
    "assets/images/pro1.webp",
    "assets/images/pro2.webp",
    "assets/images/pro3.webp",
    "assets/images/pro4.webp",
    "assets/images/pro6.webp",
    "assets/images/pro5.webp"
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Size halfwidth= MediaQuery.of(context).size/ 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 25
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              alignment: Alignment.center,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search here...',
                    border: InputBorder.none,
                    icon: Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.black),
                  ),
                  onChanged: (value) {

                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(onPressed: () {

            }, icon: const Icon(Icons.shopping_cart,
              size: 25,
              color: Colors.black,)),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
              children: [
                const SizedBox(height: 5,),
                const Align(
                    alignment: Alignment(-0.99, 0),
                    child:
                    Text("CASIO",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.red
                      ),)),
                const Align(
                    alignment: Alignment(-0.95, 0),
                    child:
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text( "G-Shock(GA-700-1BDR)Analog-Digital Watch-For Men G715",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),),
                    )),
                const Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                    ),
                    Icon(
                      Icons.star_half,
                      color: Colors.orangeAccent,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.orangeAccent,
                    ),
                  ],
                ),
                Stack(
                    children:[ CarouselSlider(
                      options: CarouselOptions(
                        height: 485,
                        autoPlay: false,
                        aspectRatio: 2.0,
                        viewportFraction: 1,
                         scrollPhysics:  BouncingScrollPhysics(),
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentindex = index;
                          });
                        },
                      ),
                      items: watchImages.map((imagePath) {
                        return Container(
                          margin: const EdgeInsets.all(5.0),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image(
                                image: AssetImage(
                                    watchImages[currentindex]
                                ),
                                fit: BoxFit.cover,
                                width: size.width,
                                height: size.height,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                      Positioned(top: 20,left: 370,
                        child: IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            size: 30,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                        ),
                      ),
                      Positioned(top: 65,left: 370,
                        child: IconButton(
                          icon: const Icon(
                            Icons.share_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {

                            });
                          },
                        ),
                      ),
                    ]
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: watchImages.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentindex == entry.key ? 17 : 7,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 3.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentindex == entry.key
                              ? Colors.black54
                              : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30, left: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                currentindex = 0;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                          image: AssetImage(watchImages[0]),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                currentindex = 1;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                        image: AssetImage(watchImages[1]),
                                        fit: BoxFit.fill,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                currentindex = 2;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
                                        image: AssetImage(watchImages[2]),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                currentindex = 3;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                          image: AssetImage(watchImages[3]),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                currentindex = 4;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                          image: AssetImage(watchImages[4]),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                currentindex = 5;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                          image: AssetImage(watchImages[5]),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Align(
                    alignment: Alignment(-0.96, 0),
                    child:
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("₹10,295.00"
                        ,style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    )
                ),
                const Align(
                  alignment: Alignment(-0.99, 0),
                  child: Text("Product Details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),),
                ),
                const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Water Resistant",
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 15
                            ),),
                          SizedBox(width: 60,),
                          Text("Yes",
                            style:TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black
                            ) ,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Display Type",
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 15
                            ),),
                          SizedBox(width: 83,),
                          Text("Analog-Digital",
                            style:TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black
                            ) ,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Series",
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 15
                            ),),
                          SizedBox(width: 123,),
                          Text("G-Shock(GG-1000-1ADR)",
                            style:TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black
                            ) ,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Occasion",
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 15
                            ),),
                          SizedBox(width: 103,),
                          Text("Sports",
                            style:TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black
                            ) ,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Watch Type",
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 15
                            ),),
                          SizedBox(width: 88,),
                          Text("Wrist Watch",
                            style:TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black
                            ) ,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Pack of",
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 15
                            ),),
                          SizedBox(width: 150,),
                          Text("1",
                            style:TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black
                            ) ,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Model Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 15
                            ),),
                          SizedBox(width: 80,),
                          Text("GG-1000-1ADR",
                            style:TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black
                            ) ,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Domestic Warranty",
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 15
                            ),),
                          SizedBox(width: 60,),
                          Text("2 Year",
                            style:TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black
                            ) ,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("International Warranty",
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 15
                            ),),
                          SizedBox(width: 40,),
                          Text("2 Year",
                            style:TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black
                            ),)
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.96, 0),
                      child: Text("Description",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Strengthen your look with G-SHOCK in a design evoking rusted iron that stands the test of time. These watches pay homage to the undying G-SHOCK quest for the ultimate toughness in neoclassic black and rust designs evoking the sheer tenacity of rusted iron. Sepia tones inspired by the textural look of rusted metal nicely complement the base black. Accents in light blue make for timeless style with a rustic flair.",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.96, 0),
                      child: Text("Manufacturer",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Imported By - Casio India Co Pvt Ltd, Casio India Co Pvt Ltd, A-41, 1st Floor, MCIE, Mathura Road, New Delhi-110044",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.96, 0),
                      child: Text("Importer",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Imported By - Casio India Co Pvt Ltd, A-41, 1st Floor, MCIE, Mathura Road, New Delhi-110044",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.96, 0),
                      child: Text("Item Dimensions LxWxH",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment(-0.99, 0),
                        child: Text("21.5 x 1.7 x 5.1 Centimeters",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.97, 0),
                      child: Text("Generic Name",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Align(
                        alignment: Alignment(-0.99, 0),
                        child: Text("Casual Watch",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ]
          )
      ),
      bottomNavigationBar: BottomAppBar(
        child: SingleChildScrollView(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: halfwidth.width,
                  height: 56,
                  color: Colors.white,
                  child: TextButton(onPressed: () {
                    Fluttertoast.showToast(msg: "Added to cart",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 10,
                        backgroundColor: Colors.grey,
                        fontSize: 16.0
                    );

                  }, child: const Text("Add to cart",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 21
                    ),)),
                ),
                Container(
                  width: halfwidth.width,
                  height: 56,
                  color: Colors.red,
                  child: TextButton(onPressed: () {

                  }, child: const Text("Buy now",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 21
                    ),)),
                ),
              ]
          ),
        ),
      ),
    );
  }
}

