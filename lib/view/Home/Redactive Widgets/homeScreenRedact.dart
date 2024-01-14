import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redacted/redacted.dart';

import '../../../core/res/constants.dart';


class HomeScreenRedact extends StatelessWidget {
  const HomeScreenRedact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black.withOpacity(0.5),
      child: Column(
        children: [
          SizedBox(
            height: 70.h,
          ),
          Row(
            children: [
              SizedBox(width: 30.w),
              CustomContainer(
                height: 50.h,
                width: 50.w,
                radius: 14.r,
                backgroundColor: Colors.transparent,
                borderColor: Colors.white,
                child: Icon(
                  Icons.filter_list_rounded,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15.w),
              CustomContainer(
                height: 50.h,
                width: 305.w,
                radius: 14.r,
                backgroundColor: Colors.transparent,
                borderColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Search Products...',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                        )),
                    SizedBox(width: 50.w),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 140.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('NEW',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
                child: CustomContainer(
                  backgroundColor: Colors.white,
                  height: 2.h,
                  width: 2.w,
                ),
              ),
              Text('MOVIE',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                  )),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text('',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                )),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainer(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  width: 210.w,
                  child: Center(
                    child: Text('POPULAR WITH FRIENDS',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ),
                CustomContainer(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: Center(
                      child: Text('15+',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                ),
                CustomContainer(
                  width: 70.w,
                  backgroundColor: Colors.amber[500],
                  child: Center(
                      child: RichText(
                    text: TextSpan(
                        text: '8.7',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '/10',
                            style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          )
                        ]),
                  )),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0).r,
                child: CustomContainer(
                  backgroundColor: Colors.white,
                  height: 2.h,
                  width: 2.w,
                ),
              ),
              Text('Crime, Drama, Thriller',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0).r,
                child: CustomContainer(
                  backgroundColor: Colors.white,
                  height: 2.h,
                  width: 2.w,
                ),
              ),
              Text('Datasat, Dolby Digital',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomContainer(
            height: 2.h,
            width: 300.w,
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.transparent,
                  Color(0XFFF10000),
                  Colors.transparent
                ],
                stops: [
                  0,
                  0.5,
                  1
                ]),
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomContainer(
            height: 40.h,
            width: 120.w,
            backgroundColor: Color(0XFFF10000),
            child: Center(
                child: Text('BUY TICKET',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ))),
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    ).redacted(context: context, redact: true);
  }
}
