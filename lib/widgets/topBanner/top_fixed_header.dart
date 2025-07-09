// lib/widgets/top_fixed_header.dart
import 'package:flutter/material.dart';
import '../../style/app_test_style.dart'; //导入应用样式
import 'package:flutter_svg/flutter_svg.dart';

class TopFixedHeader extends StatefulWidget {
  const TopFixedHeader({super.key});

  @override
  State<TopFixedHeader> createState() => _TopFixedHeaderState();
}

class _TopFixedHeaderState extends State<TopFixedHeader> {
  String selectedChain = 'SOL'; // 默认选中的链

  @override
  Widget build(BuildContext context) {
    // 获取主题中的颜色和文本样式
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      color: colorScheme.background, // 背景色，与 AppBar 类似
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        // 使用 Column 垂直排列顶部操作区和导航标签
        children: [
          // 第一行：Logo, 链选择, 搜索, 设置, 登录/注册
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Logo (左上角小恐龙)
              SvgPicture.asset(
                'assets/images/logo_small2.svg',
                width: 24,
                height: 24,
              ),
              Spacer(),
              // ===========================================
              // 使用 PopupMenuButton 实现链选择器
              // ===========================================
              Theme(
                data: Theme.of(context).copyWith(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                ),
                child: PopupMenuButton<String>(
                  initialValue: selectedChain, // 初始值
                  onSelected: (String newValue) {
                    setState(() {
                      selectedChain = newValue;
                    });
                    print('选择的链: $newValue');
                  },
                  offset: const Offset(-36, 28),

                  // 自定义按钮（child）的外观
                  child: Container(
                    // padding: const EdgeInsets.symmetric(
                    //   horizontal: 12,
                    //   vertical: 8,
                    // ),
                    // decoration: BoxDecoration(
                    //   color: AppColors.darkCardBackground,
                    //   borderRadius: BorderRadius.circular(8),
                    // ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _getChainIcon(selectedChain, size: 24),
                        const SizedBox(width: 6),
                        Text(selectedChain, style: textTheme.titleMedium),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.secondaryText,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                  // 构建菜单项列表
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                        _buildChainPopupMenuItem('SOL', textTheme),
                        _buildChainPopupMenuItem('ETH', textTheme),
                        _buildChainPopupMenuItem('Base', textTheme),
                        _buildChainPopupMenuItem('BSC', textTheme),
                        _buildChainPopupMenuItem(
                          'Tron',
                          textTheme,
                        ), // 这里复用之前的 _buildChainMenuItem
                      ],
                  // 自定义弹出菜单的样式
                  // 这个 menuBuilder 可以让你完全控制弹出的 Widget
                  // 但要实现图片中的圆角和背景，需要更多的包装
                  // preferredSize: Size.fromWidth(200), // 设置弹出菜单的最小宽度
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ), // 设置圆角
                  // color: colorScheme.surface, // 设置背景色
                ),
              ),

              // ===========================================
              SizedBox(width: 12),
              // 搜索图标
              GestureDetector(
                onTap: () {
                  print('点击设置');
                },
                child: Container(child: Icon(Icons.search, size: 14)),
              ),
              SizedBox(width: 12),
              // 设置图标
              GestureDetector(
                onTap: () {
                  print('点击设置');
                },
                child: Container(child: Icon(Icons.settings, size: 14)),
              ),
              SizedBox(width: 12),
              // Sign Up 按钮
              ElevatedButton(
                onPressed: () {
                  print('点击 Sign Up');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(85, 28),
                  backgroundColor: AppColors.darkGreyButton, // 使用主题中的强调色
                  foregroundColor: AppColors.primaryText, // 强调色上的文字颜色

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),

                  textStyle: AppTextStyles.caption, // 使用主题中的按钮文本样式
                ),
                child: const Text('Sign Up'),
              ),
              SizedBox(width: 10),
              // Log In 按钮
              ElevatedButton(
                onPressed: () {
                  print('点击 Log In');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(85, 28),
                  backgroundColor: Colors.white, // Log In 按钮背景不同
                  foregroundColor: Colors.black, // 按钮文字颜色

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: colorScheme.onSurface.withOpacity(0.3),
                      width: 1,
                    ), // 描边
                  ),

                  textStyle: AppTextStyles.caption,
                ),
                child: const Text('Log In'),
              ),
            ],
          ),
          const SizedBox(height: 12), // 分隔上下两行
          // 第二行：导航标签
          SizedBox(
            // 使用 SizedBox 限制高度，包含可滚动的标签
            height: 40, // 标签行的高度
            child: ListView(
              scrollDirection: Axis.horizontal, // 水平滚动
              children: [
                _buildTab('Trending', textTheme),
                _buildTab('xStocks', textTheme),
                _buildTab('CopyTrade', textTheme),
                _buildTab('Snipe', textTheme),
                _buildTab('Swap', textTheme),
                _buildTab('Farm', textTheme),
                _buildTab('Lending', textTheme),
                _buildTab('NFT', textTheme),
                _buildTab('Launchpad', textTheme),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 辅助方法：构建 PopupMenuItem
  PopupMenuItem<String> _buildChainPopupMenuItem(
    String chain,
    TextTheme textTheme,
  ) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return PopupMenuItem<String>(
      value: chain,
      child: Builder(
        builder: (innerContext) {
          return InkWell(
            // 这里不需要 onTap，因为它会被 PopupMenuItem 的 onSelected 覆盖
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ), // PopupMenuItem 默认有 padding
              decoration: BoxDecoration(
                color: selectedChain == chain
                    ? Colors.white10
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8), // 圆角半径为16
              ),
              child: Row(
                children: [
                  _getChainIcon(chain, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    chain,
                    style: textTheme.bodyLarge?.copyWith(
                      color: selectedChain == chain
                          ? colorScheme.secondary
                          : colorScheme.onSurface,
                      fontWeight: selectedChain == chain
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTab(String title, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(
          title,
          style: textTheme.bodyMedium?.copyWith(
            color: title == 'Trending'
                ? AppColors.accentColor
                : AppColors.primaryText,
            fontWeight: title == 'Trending'
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
        backgroundColor: AppColors.darkCardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: title == 'Trending'
                ? AppColors.accentColor
                : AppColors.darkCardBackground,
            width: 1.0,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  Widget _getChainIcon(String chain, {double size = 20}) {
    switch (chain) {
      case 'SOL':
        return Icon(Icons.circle, color: const Color(0xFF9945FF), size: size);
      case 'ETH':
        return Icon(Icons.circle, color: const Color(0xFF627EEA), size: size);
      case 'Base':
        return Icon(Icons.circle, color: Colors.blueAccent, size: size);
      case 'BSC':
        return Icon(Icons.circle, color: const Color(0xFFF0B90B), size: size);
      case 'Tron':
        return Icon(Icons.circle, color: const Color(0xFFEE060F), size: size);
      default:
        return Icon(
          Icons.help_outline,
          color: AppColors.secondaryText,
          size: size,
        );
    }
  }
}
