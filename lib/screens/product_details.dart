import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  CarouselController carouselController = CarouselController();
  int currentindex=0;
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          iconTheme: const IconThemeData(
              color: Colors.black
          ),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15,),
            const Align(
                alignment: Alignment(-0.99, 0),
                child:
                Text("CASIO",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),)),
            const Align(
                alignment: Alignment(-0.95, 0),
                child:
                Text( "G-Shock(GA-700-1BDR)Analog-Digital Watch-For Men G715",
                  style: TextStyle(
                      fontSize: 18
                  ),)),
            const SizedBox(height: 10,),
            CarouselSlider(
              options: CarouselOptions(
                height: 500,
                autoPlay: false,
                aspectRatio: 2.0,
                viewportFraction: 1,
                scrollPhysics: const BouncingScrollPhysics(),
                onPageChanged: (index, reason) {
                  setState(() {
                    currentindex =index;
                  });
                },
              ),
              items: watchImages.map((items) {
                return Container(
                  margin: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Image(image: AssetImage(
                        watchImages[currentindex]),
                      fit: BoxFit.cover,
                      width: size.width,
                      height: size.height,
                    ),
                  ),
                );
              }).toList(),
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
                Text("₹10,295.00"
                  ,style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                )
            ),
         const Padding(
           padding: EdgeInsets.all(8.0),
           child: Align(
             alignment: Alignment(-0.96, 0),
             child: Text("Product Details",
               style: TextStyle(
               fontWeight: FontWeight.w300,
                 fontSize: 25
             ),),
           ),
         ),
            const Column(
              children: [
                Row(
                  children: [
                    Text("Water Resistant",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 21
                      ),),
                    Text("Yes",
                      style:TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 21,
                          color: Colors.black
                      ) ,),
                  ],
                ),
                Row(
                  children: [
                    Text("Display Type",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 21
                      ),),
                    Text("Analog-Digital",
                      style:TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 21,
                          color: Colors.black
                      ) ,),
                  ],
                ),
                Row(
                  children: [
                    Text("Series",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 21
                      ),),
                    Text("G-Shock(GG-1000-1ADR)",
                      style:TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 21,
                          color: Colors.black
                      ) ,),
                  ],
                ),
                Row(
                  children: [
                    Text("Occasion",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 21
                      ),),
                    Text("Sports",
                      style:TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 21,
                          color: Colors.black
                      ) ,),
                  ],
                ),
                Row(
                  children: [
                    Text("Watch Type",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 21
                      ),),
                    Text("Wrist Watch",
                      style:TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 21,
                          color: Colors.black
                      ) ,),
                  ],
                ),
                Row(
                  children: [
                    Text("Pack of",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 21
                      ),),
                    Text("1",
                      style:TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 21,
                          color: Colors.black
                      ) ,),
                  ],
                ),
                Row(
                  children: [
                    Text("Model Name",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 21
                      ),),
                    Text("GG-1000-1ADR",
                      style:TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 21,
                          color: Colors.black
                      ) ,),
                  ],
                ),
                Row(
                  children: [
                    Text("Domestic Warranty",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 21
                      ),),
                    Text("2 Year",
                      style:TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 21,
                          color: Colors.black
                      ) ,),
                  ],
                ),
                Row(
                  children: [
                    Text("International Warranty",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 21
                      ),),
                    Text("2 Year",
                      style:TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 21,
                          color: Colors.black
                      ),)
                  ],
                ),
              ],
            )
      ]
    )
    ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 216,
                height: 60,
                color: Colors.white,
                child: TextButton(onPressed: () {

                }, child: const Text("Add to cart",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23
                  ),)),
              ),
              Container(
                width: 216,
                height: 60,
                color: Colors.redAccent,
                child: TextButton(onPressed: () {

                }, child: const Text("Buy now",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23
                  ),)),
              ),
            ]
        ),
      ),
    );
  }
}

