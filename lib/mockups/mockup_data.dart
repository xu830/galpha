// lib/mockups/mock_data.dart

/// 模拟的链数据列表
/// 包含每个链的名称和模拟的颜色值（用于图标）
const List<Map<String, dynamic>> mockChains = [
  {'name': 'SOL', 'color': 0xFF9945FF}, // Solana purple
  {'name': 'ETH', 'color': 0xFF627EEA}, // Ethereum blue
  {'name': 'Base', 'color': 0xFF3D7EEA}, // Base blue (example color)
  {'name': 'BSC', 'color': 0xFFF0B90B}, // Binance Smart Chain yellow
  {'name': 'Tron', 'color': 0xFFEE060F}, // Tron red
];

/// 定义每个链对应的选项卡配置
/// 'id' 用于逻辑判断，'label' 用于显示
const Map<String, List<Map<String, String>>> mockTabs = {
  'SOL': [
    {'id': 'trenches', 'label': 'Trenches'},
    {'id': 'new', 'label': 'New'},
    {'id': 'trending', 'label': 'Trending'},
    {'id': 'xstocks', 'label': 'xStocks'},
    {'id': 'copytrade', 'label': 'CopyTrade'},
    {'id': 'snipex', 'label': 'SnipeX'},
    {'id': 'monitor', 'label': 'Monitor'},
    {'id': 'track', 'label': 'Track'},
    {'id': 'holding', 'label': 'Holding'},
  ],
  'ETH': [
    {'id': 'new', 'label': 'New'},
    {'id': 'trending', 'label': 'Trending'},
    {'id': 'track', 'label': 'Track'},
    {'id': 'holding', 'label': 'Holding'},
  ],
  'Base': [
    {'id': 'trenches', 'label': 'Trenches'},
    {'id': 'new', 'label': 'New'},
    {'id': 'trending', 'label': 'Trending'},
    {'id': 'discover', 'label': 'Discover'},
    {'id': 'monitor', 'label': 'Monitor'},
    {'id': 'track', 'label': 'Track'},
    {'id': 'holding', 'label': 'Holding'},
  ],
  'BSC': [
    {'id': 'trenches', 'label': 'Trenches'},
    {'id': 'new', 'label': 'New'},
    {'id': 'trending', 'label': 'Trending'},
    {'id': 'discover', 'label': 'Discover'},
    {'id': 'monitor', 'label': 'Monitor'},
    {'id': 'track', 'label': 'Track'},
    {'id': 'holding', 'label': 'Holding'},
  ],
  'Tron': [
    {'id': 'trenches', 'label': 'Trenches'},
    {'id': 'new', 'label': 'New'},
    {'id': 'trending', 'label': 'Trending'},
    {'id': 'discover', 'label': 'Discover'},
    {'id': 'track', 'label': 'Track'},
    {'id': 'holding', 'label': 'Holding'},
  ],
};
