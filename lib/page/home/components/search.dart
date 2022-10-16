import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_info/constants.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 36,
      decoration: BoxDecoration(
        color: kGrey.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 8,
          ),
          SvgPicture.asset(
            "assets/icons/icon-search.svg",
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 17,
                letterSpacing: -0.41,
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 17,
                  letterSpacing: -0.41,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          // SvgPicture.asset(
          //   "assets/icons/icon-mic.svg",
          // ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}