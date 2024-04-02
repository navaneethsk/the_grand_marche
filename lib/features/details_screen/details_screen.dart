import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_grand_marche/core/constants/colors/palletes.dart';
import 'package:the_grand_marche/main.dart';
import 'package:the_grand_marche/model/restaurant_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HotelDetailsScreen extends StatefulWidget {
  final Restaurant restaurant;
  final String hotelImage;
  final double rating;
  const HotelDetailsScreen(
      {super.key,
      required this.restaurant,
      required this.hotelImage,
      required this.rating});

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  bool _isExpanded = false;
  int selectedIndex = 0;
  List openingHours = [];
  Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrlString(googleUrl)) {
      await launchUrlString(googleUrl);
    } else {
      throw 'Could not launch $googleUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Pallets.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.directions,
              color: Colors.white,
              size: width * .05,
            ),
            Text(
              "GO",
              style: TextStyle(
                  fontSize: width * .03,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
        onPressed: () {
          openMap(widget.restaurant.latlng.lat, widget.restaurant.latlng.lng);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * .3,
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        widget.hotelImage,
                      ),
                      fit: BoxFit.fill)),
              child: Padding(
                padding: EdgeInsets.only(
                    top: width * .06, left: width * .03, bottom: width * .03),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.black,
                            size: width * 0.08,
                          )),
                      Text(
                        widget.restaurant.name,
                        style: TextStyle(
                            fontSize: width * .045, color: Colors.black),
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: width * .03,
            ),
            Container(
              height: height * .22,
              width: width,
              padding: EdgeInsets.all(width * .03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.restaurant.name,
                        style: TextStyle(
                            fontSize: width * .05,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Container(
                        height: width * .07,
                        width: width * .15,
                        padding: EdgeInsets.only(
                            left: width * .02, right: width * .02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * .06),
                          color: Colors.green,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.rating.toStringAsFixed(1),
                                style: TextStyle(
                                    fontSize: width * .04,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: width * .04,
                              )
                            ]),
                      )
                    ],
                  ),
                  Text(
                    widget.restaurant.neighborhood.name.substring(0, 1) +
                        widget.restaurant.neighborhood.name
                            .substring(1)
                            .toLowerCase(),
                    style: TextStyle(
                        fontSize: width * .04, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          radius: width * .03,
                          child: Icon(
                            Icons.restaurant_menu_rounded,
                            size: width * .04,
                          )),
                      SizedBox(
                        width: width * .02,
                      ),
                      Text(
                        widget.restaurant.cuisineType,
                        style: TextStyle(fontSize: width * .04),
                      )
                    ],
                  ),
                  SizedBox(
                    height: width * .03,
                  ),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.location_solid,
                        size: width * .06,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: width * .02,
                      ),
                      Text(
                        widget.restaurant.address,
                        style: TextStyle(fontSize: width * .04),
                      )
                    ],
                  ),
                  SizedBox(
                    height: width * .03,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_filled_rounded,
                        size: width * .06,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: width * .02,
                      ),
                      // DropdownButton(
                      //   items: openingHours.map<DropdownMenuItem<String>((String value) {
                      //     return DropdownMenuItem(
                      //       child: widget.restaurant.operatingHours.
                      //       )
                      //   }),
                      //   onChanged: onChanged
                      //   )
                      Text(
                        "Wednesday : 5:30pm - 12:00am ",
                        style: TextStyle(fontSize: width * .04),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: width * 0.06,
            ),
            Padding(
              padding: EdgeInsets.only(top: width * .03, left: width * .03),
              child: Text(
                "Ratings & Reviews",
                style: TextStyle(
                    fontSize: width * .06, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.separated(
              itemCount: widget.restaurant.reviews.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: selectedIndex == index && _isExpanded
                      ? height * .3
                      : height * .18,
                  width: width,
                  padding: EdgeInsets.all(width * .02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: width * .07,
                            width: width * .13,
                            padding: EdgeInsets.only(
                                left: width * .03, right: width * .03),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * .06),
                              color: Colors.green,
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.restaurant.reviews[index].rating
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: width * .04,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: width * .04,
                                  )
                                ]),
                          ),
                          SizedBox(
                            width: width * .01,
                          ),
                          Text(
                            widget.restaurant.reviews[index].name,
                            style: TextStyle(fontSize: width * .04),
                          )
                        ],
                      ),
                      selectedIndex == index && _isExpanded
                          ? Text(
                              widget.restaurant.reviews[index].comments,
                              textAlign: TextAlign.justify,
                            )
                          : Text(
                              '${widget.restaurant.reviews[index].comments.substring(0, 178)}...',
                              textAlign: TextAlign.justify,
                            ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                widget.restaurant.reviews[index].date.name
                                        .substring(0, 7) +
                                    ' ' +
                                    widget.restaurant.reviews[index].date.name
                                        .substring(8, 10) +
                                    " " +
                                    widget.restaurant.reviews[index].date.name
                                        .substring(10),
                                style: TextStyle(fontSize: width * .024),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {});
                              selectedIndex = index;
                              _isExpanded = !_isExpanded;
                            },
                            child: Text(
                              selectedIndex == index && _isExpanded
                                  ? "Read less"
                                  : "Read more",
                              style: TextStyle(
                                  fontSize: width * .03,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            )
          ],
        ),
      ),
    );
  }
}
