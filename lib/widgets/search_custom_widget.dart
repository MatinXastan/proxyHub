import 'package:flutter/material.dart';
import 'package:proxy_fast_telegram/constants/colors.dart';
import 'package:proxy_fast_telegram/constants/sizes.dart';
import 'package:proxy_fast_telegram/constants/text_styles.dart';

class SearchCustomWidget extends StatelessWidget {
  const SearchCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSizes.paddingleft,
        AppSizes.paddingTop,
        AppSizes.paddingRight,
        AppSizes.paddingbottom,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors
              .searchFieldBackground, // رنگ پس‌زمینه تیره متناسب با تصویر
          borderRadius: BorderRadius.circular(
            50,
          ), // ایجاد حالت کپسولی کاملاً گرد
        ),
        child: TextField(
          style: const TextStyle(color: Colors.white), // رنگ متن تایپ شده
          decoration: InputDecoration(
            hintText: 'Search country or speed...',
            hintStyle: AppTextStyles.bigTitle.copyWith(
              color: Color(0xFF63738a),
            ), // رنگ متن راهنما
            border: InputBorder.none, // حذف خط زیر پیش‌فرض TextField
            // آیکون ذره‌بین در سمت چپ
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xFF63738a),
              size: AppSizes.iconSizeMedium,
            ),
          ),
        ),
      ),
    );
  }
}
