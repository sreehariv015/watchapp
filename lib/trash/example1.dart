
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          // padding: EdgeInsets.only(top: 65, bottom: 20, left: 20, right: 20),
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(children: [
            Positioned(
              top: 5,
              left: 10,
              right: 10,
              bottom: 20,
              child: SizedBox(
                height: 20,
                //color: Colors.red,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment(-0.96, 0),
                      child: Text("Trending deals",
                          style: TextStyle(
                            fontFamily: 'Poppins-SemiBold',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0xFF3C3268),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        print(currentIndex);
                      },
                      child: CarouselSlider(
                        items: imgList.map((item) {
                          return SizedBox(
                            width: double.infinity,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(item,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 500),
                              ),
                            ),
                          );
                        }).toList(),
                        carouselController: carouselController,
                        options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2.0,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => carouselController.animateToPage(entry.key),
                          child: Container(
                            width: currentIndex == entry.key ? 17 : 7,
                            height: 7.0,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 3.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentIndex == entry.key
                                  ? Colors.red
                                  : Colors.teal,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                  ],
                ),
              ),
            ),

            const Positioned(
              top: 240,
              left: 20,
              bottom: 0,
              right: 0,
              child: SizedBox(
                height: 20,
                // color: Colors.red,
                child: Text("All deals",
                    style: TextStyle(
                      fontFamily: 'Poppins-SemiBold',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Color(0xFF3C3268),
                    )),
              ),
            ),
            Positioned(
                left: 10,
                right: 10,
                top: 280,
                bottom: 0,
                child: GridView.builder(
                  shrinkWrap: false,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(0),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => ProductDetails(),
                        //   ),
                        // );
                      },

                      child: Container(
                        // padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0x91595959),
                              width: 2.0,
                            ),
                          ),
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: SizedBox(
                                    height: 85,
                                    width: 140,
                                    // color: Colors.red,
                                    child: Center(
                                      child: Image(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/img5.png')),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text("Lenovo laptop"),
                                  subtitle: Text("₹3200 only"),
                                )
                              ],
                            ),
                          )),
                    );
                  },
                )),
          ]),
        ),

      ),
    );
  }
}