// lib/core/app_text_styles.dart

import 'package:flutter/material.dart';

// 定义应用中常用的颜色，方便 TextStyle 使用
// 这里的颜色可以根据 gmgn.ai 网站的主题色来定义
class AppColors {
  static const Color primaryText = Color(0xFFF0F5F5); // 网站中常见的亮色文本
  static const Color secondaryText = Colors.grey; // 次要文本颜色
  static const Color accentColor = Color(0xFF67E8AB); // 强调色，例如按钮或高亮
  static const Color darkBackground = Color(0xFF1E1E1E); // 深色背景
  static const Color darkCardBackground = Color(0xFF2B2B2B); // 卡片深色背景
  static const Color getGreenButton = Color(0xFF99E0BF); //获取绿色按钮颜色
  static const Color darkGreyButton = Color(0xFF232529);
}

class AppTextStyles {
  // 通用的基础文本样式
  static const TextStyle baseTextStyle = TextStyle(
    fontFamily: 'monospace',
    fontSize: 14,
    height: 1.5,
    letterSpacing: -0.2,
  );

  // 标题样式
  static final TextStyle headline1 = baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle headline2 = baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  // 子标题样式
  static final TextStyle subhead1 = baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600, // Semi-bold
  );

  static final TextStyle subhead2 = baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500, // Medium
  );

  // 常规正文文本样式
  static final TextStyle bodyText1 = baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle bodyText2 = baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText, // 次要文本颜色
  );

  // 按钮文本样式
  static final TextStyle buttonText = baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black, // 按钮文字通常是深色
  );

  // 小号文本样式 (例如用于描述或标签)
  static final TextStyle caption = baseTextStyle.copyWith(
    fontSize: 12,
    color: Colors.grey[600],
  );

  // 更多样式...
  static final TextStyle gmgnLogoTitle = baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle solanaChainText = baseTextStyle.copyWith(
    fontSize: 16,
    color: Colors.grey[400],
  );

  static final TextStyle bannerTitle = baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle bannerSubtitle = baseTextStyle.copyWith(
    fontSize: 14,
    color: Colors.grey,
  );
}
