import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FoodTabs extends StatefulWidget {
  const FoodTabs({Key? key}) : super(key: key);

  @override
  _FoodTabsState createState() => _FoodTabsState();
}

class _FoodTabsState extends State<FoodTabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildListItem('Delicious Hot Dog', 4.0, '6', 'assets/hotdog.png'),
          _buildListItem('Cheese Pizza', 5.0, '12', 'assets/pizza.png')
        ],
      ),
    );
  }

  _buildListItem(String foodName, rating, String price, String imgPath) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: [
                Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Color(0xFFFFE3DF)),
                  child: Center(
                      child: Image.asset(imgPath, height: 50.0, width: 50.0)),
                ),
                SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      foodName,
                      style: GoogleFonts.notoSans(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 4,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemSize: 17.5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Row(
                      children: <Widget>[
                        Text('\$' + price,
                          style: GoogleFonts.notoSans(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            textStyle: TextStyle(
                              color: Color(0xFFF68D7F)
                            ),
                          ),
                        ),
                        SizedBox(width: 3.0),
                        Text(
                          '\$' + '18',
                          style: GoogleFonts.lato(
                            fontSize: 12.0,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w600,
                            textStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.4)
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          FloatingActionButton(
            heroTag: foodName,
            mini: true,
            onPressed: () {},
            child: Center(
              child: Icon(Icons.add, color: Colors.white),
            ),
            backgroundColor: Color(0xFFFE7D6A),
          )
        ],
      ),
    );
  }
}
