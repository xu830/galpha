// lib/widgets/gmgn_app_banner.dart
import 'package:flutter/material.dart';
import '../../style/app_test_style.dart';//导入应用样式

class DownloadBanner extends StatelessWidget {
  const DownloadBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2B2B2B), // Banner 的背景颜色
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // 左侧的 Logo/图标
          Container(
            width: 48,
            height: 48,
            child: Center(
              // 粉色小恐龙图标
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('images/appLogo.png', fit: BoxFit.cover),
              ),
            ),
          ),
           const SizedBox(width: 10),
          // 中间的文本内容
           Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'GMGN App',
                  style:AppTextStyles.baseTextStyle.copyWith(color: Color(0xFFF0F5F5),fontWeight: FontWeight.w600,),
                ),
                
                Text(
                  'Discover faster, Trading in seconds',
                  style:AppTextStyles.copyWith(color: Colors.grey,fontWeight: FontWeight.w400,)
                ),
              ],
            ),
          ),
          Spacer(),
          // 右侧的 "Get" 按钮
          ElevatedButton(
            onPressed: () {
              // TODO: 实现点击 "Get" 按钮后的跳转逻辑
              print('GMGN App Get 按钮被点击');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.getGreenButton, // 按钮背景色，偏亮的绿色
              foregroundColor: Colors.black, // 按钮文字颜色
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // 按钮圆角
              ),
              // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              minimumSize: Size(80, 36),
            ),
            child: const Text(
              'Get',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}