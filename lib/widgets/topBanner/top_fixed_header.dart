// lib/widgets/top_fixed_header.dart
import 'package:flutter/material.dart';
import '../../style/app_test_style.dart';//导入应用样式
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
      child: Column( // 使用 Column 垂直排列顶部操作区和导航标签
        children: [
          // 第一行：Logo, 链选择, 搜索, 设置, 登录/注册
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo (左上角小恐龙)
               SvgPicture.asset('assets/images/logo_small2.svg', width: 24, height: 24),
              // 链选择器 (SOL 下拉菜单)
              Expanded( // 使用 Expanded 确保链选择器占用可用空间
                child: GestureDetector(
                  onTap: () {
                    // TODO: 显示链选择的下拉菜单
                    _showChainSelection(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                      color:Colors.transparent, // 背景色
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // 确保 Row 不占用过多空间
                      children: [
                        // 链图标
                        _getChainIcon(selectedChain, size: 16),
                        const SizedBox(width: 6),
                        // 链名称
                        Text(
                          selectedChain,
                          style: textTheme.titleMedium, // 使用主题样式
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.keyboard_arrow_down, color: AppColors.secondaryText, size: 20),
                      ],
                    ),
                  ),
                ),
              ),

              // 搜索图标
              IconButton(
                icon: const Icon(Icons.search),
                iconSize:14,
                onPressed: () {
                  print('点击搜索');
                },
                color: colorScheme.onBackground, // 使用主题颜色
              ),

              // 设置图标
              IconButton(
                icon: const Icon(Icons.settings), // 或者 Icons.tune
                iconSize:14,
                onPressed: () {
                  print('点击设置');
                },
                color: colorScheme.onBackground,
              ),

              // Sign Up 按钮
              ElevatedButton(
                onPressed: () {
                  print('点击 Sign Up');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.secondary, // 使用主题中的强调色
                  foregroundColor: colorScheme.onSecondary, // 强调色上的文字颜色
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  minimumSize: Size.zero, // 确保按钮大小适应内容
                  textStyle: AppTextStyles.caption, // 使用主题中的按钮文本样式
                ),
                child: const Text('Sign Up'),
              ),

              // Log In 按钮
              ElevatedButton(
                onPressed: () {
                  print('点击 Log In');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkCardBackground, // Log In 按钮背景不同
                  foregroundColor: colorScheme.onSurface, // 按钮文字颜色
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: colorScheme.onSurface.withOpacity(0.3), width: 1), // 描边
                  ),
                  minimumSize: Size.zero,
                  textStyle: AppTextStyles.caption,
                ),
                child: const Text('Log In'),
              ),
            ],
          ),
          const SizedBox(height: 12), // 分隔上下两行

          // 第二行：导航标签
          SizedBox( // 使用 SizedBox 限制高度，包含可滚动的标签
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

  // 辅助方法：构建单个标签
  Widget _buildTab(String title, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip( // Chip 是一个很好的选择，可以自定义形状和颜色
        label: Text(
          title,
          style: textTheme.bodyMedium?.copyWith(
            color: title == 'Trending' ? AppColors.accentColor : AppColors.primaryText, // 选中效果
            fontWeight: title == 'Trending' ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        backgroundColor: AppColors.darkCardBackground, // Chip 背景色
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: title == 'Trending' ? AppColors.accentColor : AppColors.darkCardBackground,
            width: 1.0,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  // 辅助方法：获取链图标
  Widget _getChainIcon(String chain, {double size = 20}) {
    // 实际项目中应使用 Image.asset 或 Image.network 加载图片
    // 这里使用 Icon 作为占位符
    switch (chain) {
      case 'SOL':
        return Icon(Icons.circle, color: const Color(0xFF9945FF), size: size); // Solana 紫色
      case 'ETH':
        return Icon(Icons.circle, color: const Color(0xFF627EEA), size: size); // Ethereum 蓝色
      case 'Base':
        return Icon(Icons.circle, color: Colors.blueAccent, size: size);
      case 'BSC':
        return Icon(Icons.circle, color: const Color(0xFFF0B90B), size: size); // BNB 链黄色
      case 'Tron':
        return Icon(Icons.circle, color: const Color(0xFFEE060F), size: size); // Tron 红色
      default:
        return Icon(Icons.help_outline, color: AppColors.secondaryText, size: size);
    }
  }

  // 模拟显示链选择菜单
  void _showChainSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkCardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext bc) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: _getChainIcon('SOL'),
                title: Text('SOL', style: Theme.of(context).textTheme.bodyLarge),
                onTap: () {
                  setState(() {
                    selectedChain = 'SOL';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: _getChainIcon('ETH'),
                title: Text('ETH', style: Theme.of(context).textTheme.bodyLarge),
                onTap: () {
                  setState(() {
                    selectedChain = 'ETH';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: _getChainIcon('Base'),
                title: Text('Base', style: Theme.of(context).textTheme.bodyLarge),
                onTap: () {
                  setState(() {
                    selectedChain = 'Base';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: _getChainIcon('BSC'),
                title: Text('BSC', style: Theme.of(context).textTheme.bodyLarge),
                onTap: () {
                  setState(() {
                    selectedChain = 'BSC';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: _getChainIcon('Tron'),
                title: Text('Tron', style: Theme.of(context).textTheme.bodyLarge),
                onTap: () {
                  setState(() {
                    selectedChain = 'Tron';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}