// lib/providers/chain_provider.dart
import 'package:riverpod/riverpod.dart';
import '../mockups/mockup_data.dart';

// 1. 定义 StateNotifier 类
class SelectedChainNotifier extends StateNotifier<String> {
  // 调用父类构造函数，并传入初始状态
  SelectedChainNotifier() : super(mockChains.first['name'] as String);

  /// 更新选中的链
  void setSelectedChain(String newChain) {
    if (state != newChain) {
      state = newChain; // 直接修改 state 即可，Riverpod 会自动通知监听者
    }
  }

  // 获取所有可用的链列表 (从 Mockup 数据)
  List<Map<String, dynamic>> getAllChains() {
    return mockChains;
  }

  // ：根据当前选中的链获取对应的选项卡列表
  List<Map<String, String>> getTabsForCurrentChain() {
    return mockTabs[state] ?? []; // 返回当前链的选项卡，如果不存在则返回空列表
  }
}

// StateNotifierProvider for selectedChain
final selectedChainProvider =
    StateNotifierProvider<SelectedChainNotifier, String>((ref) {
      return SelectedChainNotifier();
    });

// ===========================================
// SelectedTabNotifier (管理当前选中的选项卡)
// ===========================================
class SelectedTabNotifier extends StateNotifier<String> {
  // 初始状态可以为空字符串，或者在 selectedChainProvider 监听中设置第一个链的第一个选项卡
  SelectedTabNotifier() : super('');

  void setSelectedTab(String newTabId) {
    if (state != newTabId) {
      state = newTabId;
    }
  }
}

// StateNotifierProvider for selectedTab
final selectedTabProvider = StateNotifierProvider<SelectedTabNotifier, String>((
  ref,
) {
  return SelectedTabNotifier();
});
