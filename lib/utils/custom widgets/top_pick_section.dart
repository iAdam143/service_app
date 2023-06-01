import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/view/ServiceDetail/service_detail_home.dart';

class TopPickRow extends StatelessWidget {
  const TopPickRow({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil().screenWidth;
    double containerHeight = screenWidth > 700 ? 420 : 250;
    double containerHeight2 = screenWidth > 700 ? 200 : 115;

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ServiceDetailHome(
                    image: 'assets/images/Rectangle 15.png',
                    title: 'Full house',
                    subTitle: 'Cleaning',
                  ),
                ),
              );
            },
            child: Container(
              width: 20.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: mySecondaryColor,
              ),
              height: containerHeight,
              padding: EdgeInsets.all(5.w),
              child: Column(
                children: [
                  const Expanded(
                    child: Image(
                      image: AssetImage('assets/images/Rectangle 15.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Full house',
                    style: heading_5.copyWith(color: myLightPColor),
                  ),
                  Text(
                    'Cleaning',
                    style: heading_5.copyWith(color: myLightPColor),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ServiceDetailHome(
                        image: 'assets/images/Rectangle 16.png',
                        title: 'Plumbing',
                        subTitle: '',
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: myLightTealColor,
                  ),
                  height: containerHeight2,
                  padding: EdgeInsets.all(5.w),
                  child: Column(
                    children: [
                      const Expanded(
                        child: Image(
                          image: AssetImage('assets/images/Rectangle 16.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Plumbing',
                        style: heading_6.copyWith(color: myLightPColor),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ServiceDetailHome(
                        image: 'assets/images/Rectangle 16 (1).png',
                        title: 'Cooking',
                        subTitle: '',
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: mygreyColor,
                  ),
                  height: containerHeight2,
                  padding: EdgeInsets.all(5.w),
                  child: Column(
                    children: [
                      const Expanded(
                        child: Image(
                          image:
                              AssetImage('assets/images/Rectangle 16 (1).png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Cooking',
                        style: heading_6.copyWith(color: myLightPColor),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
