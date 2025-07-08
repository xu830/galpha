// lib/home_page.dart
import 'package:flutter/material.dart';
import 'widgets/topBanner/download_banner.dart'; // 导入下载banner
import 'widgets/topBanner/top_fixed_header.dart';//导入顶部固定导航栏

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: const Color(0xFF1E1E1E),
    //     elevation: 0,
    //     title: Row(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         const Text(
    //           'gmgn.ai',
    //           style: TextStyle(
    //             color: Colors.white,
    //             fontWeight: FontWeight.bold,
    //             fontSize: 22,
    //           ),
    //         ),
    //         const SizedBox(width: 8),
    //         Text(
    //           'Solana',
    //           style: TextStyle(
    //             color: Colors.grey[400],
    //             fontSize: 16,
    //           ),
    //         ),
    //       ],
    //     ),
    //     actions: [
    //       IconButton(
    //         icon: const Icon(Icons.search, color: Colors.white),
    //         onPressed: () {
    //           print('搜索按钮被点击');
    //         },
    //       ),
    //       IconButton(
    //         icon: const Icon(Icons.more_vert, color: Colors.white),
    //         onPressed: () {
    //           print('更多选项按钮被点击');
    //         },
    //       ),
    //     ],
    //   ),
      body: Column(
        children: [
          // 引用我们独立的 GMGN App Banner 组件
          const DownloadBanner(), // 这里直接使用 GmgnAppBanner 组件
          const TopFixedHeader(),
          // 下方是页面的主要内容，它可以是可滚动的
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // 这里可以放置你的主要内容，例如代币列表、图表等
                    for (int i = 0; i < 20; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          '这是页面的主要内容区域 $i',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}