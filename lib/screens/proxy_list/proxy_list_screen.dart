import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:proxy_fast_telegram/constants/colors.dart';
import 'package:proxy_fast_telegram/constants/sizes.dart';
import 'package:proxy_fast_telegram/constants/text_styles.dart';
import 'package:proxy_fast_telegram/widgets/search_custom_widget.dart';

class ProxyListScreen extends StatelessWidget {
  const ProxyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ۱. تنظیم فاصله متن از لبه چپ (به طور پیش‌فرض ۱۶ است، اما برای اطمینان ست می‌کنیم)
        titleSpacing: 16.0,

        title: Text('Proxy Hub', style: AppTextStyles.appBarTitle),

        centerTitle: false,

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            color: AppColors.lightBlueAccent, // هماهنگ با استایل متن‌های ثانویه
          ),
          // ۲. ایجاد فاصله ۱۶ پیکسلی در انتهای سمت راست
          const SizedBox(width: 8.0),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: AppSizes.sizedBoxHeightMedium),
            SearchCustomWidget(),
            CustomElevatedButton(
              iconData: Icons.speed,
              buttonText: 'Test All Proxies',
              padLeft: AppSizes.paddingleft,
              padRight: AppSizes.paddingRight,
              padTop: AppSizes.paddingTop,
              padBottom: AppSizes.sizedBoxHeightLarge,
              minSize: const Size(double.infinity, 60),
            ),
            TagListViewWidget(),
            CustomDivider(),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 25,
                itemBuilder: (context, index) {
                  return customCardViewWidget(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding customCardViewWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.warningOrange,
          borderRadius: BorderRadius.circular(36),
        ),
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            color: AppColors.cardBackgroundColor,
            borderRadius: BorderRadius.circular(36),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    /* crossAxisAlignment: CrossAxisAlignment.center, */
                    children: [
                      circleCustom(
                        sizeCircleCustom: 55,
                        child: Text(
                          countryCodeToEmoji('US'),
                          style: TextStyle(
                            fontSize: 24,
                          ), // ابعاد اموجی با fontSize تغییر می‌کند
                        ),
                      ),
                      SizedBox(width: AppSizes.sizedBoxSmall),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            '185.120.4.22',
                            style: AppTextStyles.appBarTitle,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                size: AppSizes.iconSizeSmall,
                                color: AppColors.warningOrange,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'checking...',
                                style: AppTextStyles.bigLargeTitle.copyWith(
                                  color: AppColors.warningOrange,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  PingStatusWidget(),
                ],
              ),
              SizedBox(height: AppSizes.sizedBoxHeightMedium),
              Row(
                children: [
                  // استفاده از Expanded باعث می‌شود کانتینر اول نصف فضا را بگیرد
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppColors.darkBackgroundDeep,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Port",
                            style: AppTextStyles.bigTitle.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text("8080", style: AppTextStyles.bigTitle),
                        ],
                      ),
                    ),
                  ),

                  // ایجاد یک فاصله کوچک بین دو کانتینر (اختیاری)
                  const SizedBox(width: 10),

                  // کانتینر دوم هم با Expanded نصف دیگر فضا را می‌گیرد
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppColors.darkBackgroundDeep,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Secret",
                            style: AppTextStyles.bigTitle.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "ee12...99a",
                            style: AppTextStyles.bigTitle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.sizedBoxHeightMedium),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 12,
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      iconData: Icons.comment,
                      buttonText: 'Connect',
                      padLeft: 0,
                      padRight: 0,
                      padTop: 0,
                      padBottom: 0,
                      minSize: Size(100, 55),
                    ),
                  ),
                  circleCustom(
                    sizeCircleCustom: 50,
                    child: Icon(
                      Icons.content_copy_rounded,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ),
                  circleCustom(
                    sizeCircleCustom: 50,
                    child: Icon(Icons.refresh, color: Colors.grey, size: 24),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container circleCustom({
    required double sizeCircleCustom,
    required Widget child,
  }) {
    final Widget children = child;
    final sizeCircle = sizeCircleCustom;

    return Container(
      alignment: Alignment.center,
      height: sizeCircle,
      width: sizeCircle,
      decoration: BoxDecoration(
        color: AppColors.cardCircleBackgroundColor,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(12),

      child: children,
    );
  }

  String countryCodeToEmoji(String countryCode) {
    // تبدیل حروف به کدهای یونیکد مربوط به پرچم‌ها
    int firstChar = countryCode.toUpperCase().codeUnitAt(0) + 127397;
    int secondChar = countryCode.toUpperCase().codeUnitAt(1) + 127397;

    return String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
  }
}

class PingStatusWidget extends StatelessWidget {
  const PingStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0A2F2F), // رنگ سبز تیره پس‌زمینه
        borderRadius: BorderRadius.circular(50), // کاملاً گرد شده
        border: Border.all(
          color: const Color(0xFF134E48), // رنگ حاشیه (Border)
          width: 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // کانتینر فقط به اندازه محتوا جمع شود
        mainAxisAlignment: MainAxisAlignment.center, // تراز افقی در مرکز
        crossAxisAlignment: CrossAxisAlignment.center, // تراز عمودی در مرکز
        children: [
          Icon(
            Icons.wifi,
            color: AppColors.successGreen, // رنگ سبز روشن آیکون
            size: 24,
          ),
          SizedBox(width: 8), // ایجاد فاصله بین آیکون و متن
          Text(
            '45ms',
            style: TextStyle(
              color: AppColors.successGreen, // رنگ سبز روشن متن
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.sizedBoxHeightLarge,
      ),
      child: Divider(height: 3, color: AppColors.dividerColor),
    );
  }
}

class TagListViewWidget extends StatelessWidget {
  const TagListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // عرض کل صفحه
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal, // مهم: برای نمایش افقی
        physics: BouncingScrollPhysics(),
        children: [
          TagCustomWidget(padLeft: 12, padRight: 6),
          TagCustomWidget(padLeft: 0, padRight: 6),
          TagCustomWidget(padLeft: 0, padRight: 6),
          TagCustomWidget(padLeft: 0, padRight: 6),
          TagCustomWidget(padLeft: 0, padRight: 6),
          TagCustomWidget(padLeft: 0, padRight: 6),
          TagCustomWidget(padLeft: 0, padRight: 6),
        ],
      ),
    );
  }
}

class TagCustomWidget extends StatelessWidget {
  final double padLeft;
  final double padRight;
  const TagCustomWidget({
    super.key,
    required this.padLeft,
    required this.padRight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(padLeft, 0, padRight, 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          color: AppColors.tagBackgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // اشغال حداقل فضا در Row
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("online", style: AppTextStyles.bigTitle),
            SizedBox(width: 4),
            Icon(
              Icons.circle,
              size: AppSizes.iconSizeSmall,
              color: AppColors.successGreen,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final IconData iconData;
  final String buttonText;
  final double padLeft;
  final double padRight;
  final double padTop;
  final double padBottom;
  final Size minSize;
  const CustomElevatedButton({
    super.key,
    required this.iconData,
    required this.buttonText,
    required this.padLeft,
    required this.padRight,
    required this.padTop,
    required this.padBottom,
    required this.minSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(padLeft, padTop, padRight, padBottom),
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
          minimumSize: WidgetStateProperty.all<Size>(minSize),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: AppColors.white,
              size: AppSizes.iconSizeMedium,
            ),
            SizedBox(width: 8),
            Text(buttonText, style: AppTextStyles.bigTitle),
          ],
        ),
      ),
    );
  }
}
