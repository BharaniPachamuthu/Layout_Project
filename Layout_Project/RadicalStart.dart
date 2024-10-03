import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'SearchPage.dart';
import 'data_view_model.dart';
import 'model.dart';

class RadicalStart extends StatefulWidget {
  const RadicalStart({super.key});
  _RadicalStartState createState() => _RadicalStartState();
}

class _RadicalStartState extends State<RadicalStart> {
  final TextEditingController controller = TextEditingController();

  late DataModel dataModel;

  @override
  void initState() {
    super.initState();
    dataModel = DataViewModel.createSampleData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: (context, child) => Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                _headerWidget(context),
                popularLocations(),
                recommended(),
                adverdisment(),
                mostviewedWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerWidget(BuildContext context) {
    return Container(
      height: 192.h,
      width: 372.w,
      color: const Color(0xffeae7f6),
      child: Padding(
        padding: EdgeInsets.all(15.0).r,
        child: Column(
          children: [
            Text(
              'Explore the World! By Travelling',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Be Vietnam Pro',
                  color: Color(0xFF131313)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 46.h,
                  width: 260.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14).r,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Where did you go?',
                      border: InputBorder.none,
                      fillColor: Color(0xFF131313),
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                    ),
                    onTap: () {
                      // You can also navigate here if preferred
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchApp()),
                      );
                    },
                  ),
                ),
                Spacer(),
                Container(
                  height: 46.h,
                  width: 44.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14).r,
                    color: Color(0xFFFFFFFF),
                  ),
                  child: Icon(Icons.tune_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget popularLocations() {
    return Container(
      height: 200.h,
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 10).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular locations',
            style: TextStyle(
              fontFamily: 'Be Vietnam Pro',
              color: Color(0xFF131313),
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 158.h,
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(dataModel.popularLocationsData.length,
                    (index) {
                  final location = dataModel.popularLocationsData[index];
                  return Stack(
                    children: [
                      Container(
                          height: 158.h,
                          width: 123.w,
                          margin: EdgeInsets.all(8).r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16).r,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16).r,
                            child: Image.asset(
                              location.image,
                              fit: BoxFit.fill,
                            ),
                          )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          location.locationName,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Be Vietnam Pro',
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget recommended() {
    return Container(
      height: 300.h,
      width: double.infinity,
      margin: EdgeInsets.only(top: 10, left: 10).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommended',
            style: TextStyle(
              fontFamily: 'Be Vietnam Pro',
              color: Color(0xFF131313),
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 250.h,
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    List.generate(dataModel.recommendedData.length, (index) {
                  final location = dataModel.recommendedData[index];
                  return Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 170.h,
                        width: 238.w,
                        margin: EdgeInsets.all(8).r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12).r,
                          color: Colors.blueAccent,
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12).r,
                              child: Image.asset(
                                location.image,
                                height: 170.h,
                                width: 238.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 12,
                              right: 12,
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: Image.asset('images/Group 38802@3x.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Text(
                                  location.price,
                                  style: TextStyle(
                                      fontFamily: 'Be Vietnam Pro',
                                      fontSize: 18,
                                      color: Color(0xFF131313),
                                      fontWeight: FontWeight.w600),
                                ),
                                Image.asset('images/thunder.png'),
                              ]),
                              SizedBox(
                                width: 120,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Color(0xFFFF5A5F),
                                  ),
                                  Text('4'),
                                ],
                              )
                            ],
                          ),
                          Text(
                            location.hotelname,
                            style: TextStyle(
                                fontFamily: 'Be Vietnam Pro',
                                fontSize: 14,
                                color: Color(0xFF131313),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            location.rooms,
                            style: TextStyle(
                                fontFamily: 'Be Vietnam Pro',
                                fontSize: 12,
                                color: Color(0xFF686868),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget adverdisment() {
    return Container(
      height: 285.h,
      width: 327.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10).r,
      ),
      child: Stack(
        children: [
          Image.asset(
            'images/Group 12211@3x.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 25).r,
            child: SizedBox(
              height: 103.h,
              width: 171.w,
              child: Column(
                children: [
                  Text(
                    'Hosting low for as free as 1%',
                    style: TextStyle(
                      fontFamily: 'Be Vietnam Pro',
                      color: Color(0xFFFFFFFF),
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      print('Button Pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF5A5F),
                      fixedSize: Size(200, 30),
                    ),
                    child: Text(
                      'Become a Host',
                      style: TextStyle(fontSize: 12, color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mostviewedWidget() {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10).r,
      child: Padding(
        padding: const EdgeInsets.all(8.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Most Viewed',
              style: TextStyle(
                fontFamily: 'Be Vietnam Pro',
                color: Color(0xFF131313),
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            Column(
              children: List.generate(dataModel.mostViewedData.length, (index) {
                final location = dataModel.mostViewedData[index];
                return Column(
                  children: [
                    Container(
                        height: 175.h,
                        width: 327.w,
                        margin: EdgeInsets.all(8).r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16).r,
                          color: Colors.blueAccent,
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16).r,
                              child: Positioned.fill(
                                child: Image.asset(
                                  location.image,
                                  height: 175.h,
                                  width: 327.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 12,
                              right: 12,
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: Image.asset('images/Group 38802@3x.png'),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.all(15).r,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      location.price,
                                      style: TextStyle(
                                          fontFamily: 'Be Vietnam Pro',
                                          fontSize: 18,
                                          color: Color(0xFF131313),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Image.asset('images/thunder.png'),
                                  ]),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Color(0xFFFF5A5F),
                                  ),
                                  Text('4'),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            location.hotelname,
                            style: TextStyle(
                                fontFamily: 'Be Vietnam Pro',
                                fontSize: 14,
                                color: Color(0xFF131313),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            location.rooms,
                            style: TextStyle(
                                fontFamily: 'Be Vietnam Pro',
                                fontSize: 12,
                                color: Color(0xFF686868),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
