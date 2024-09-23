import 'package:carousel_slider/carousel_slider.dart';
import 'package:dc_box_app/generated/app_image/app_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerCarouselCom extends StatelessWidget {
  const BannerCarouselCom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.w,
      child: CarouselSlider(
        items: [
          AppImage.banners.bgBanner1(),
          AppImage.banners.bgBanner2(),
          AppImage.banners.bgBanner3(),
          AppImage.banners.bgBanner4(),
        ],
        options: CarouselOptions(
          height: 150.w,
          viewportFraction: 1.0,
          autoPlay: true,
        ),
      ),
    );
  }
}
