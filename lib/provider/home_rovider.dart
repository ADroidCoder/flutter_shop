import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_shop/dao/home_dao.dart';
import 'package:flutter_shop/model/home_entity.dart';
import 'package:flutter_shop/model/store_entity.dart';

class HomeProvider with ChangeNotifier {
  List<HomeListItem> _items = List<HomeListItem>();

  //
  List<HomeListItem> get items => UnmodifiableListView(_items);

  Completer<bool> _isInit = Completer<bool>();

  Future<bool> get isInit => _isInit.future;

  HomeProvider() {
    _init();
  }

  /// 更新最新数据
  void update() async{
    await _load();
    debugPrint("已经是最新");
    notifyListeners();
  }

  /// 加载更多
  void next() async{
    await _load();
    debugPrint("已经加载了更多");
    notifyListeners();
  }

  void _init() async {
    await _load();
    // 数据加载完成
    _isInit.complete(true);
    notifyListeners();
  }

  /// 网络数据请求
  Future<void> _load() async {
    StoreEntity stores = await HomeDao.fetch();
    var result = List<HomeListItem>();
    // 列表中的头部
    result.add(HeadMenuItem());
    result.add(ScrollMenuItem());
    result.add(GridMenuItem());
    result.add(AdBarItem());
    result.add(OfferItem());

    if (stores != null) {
      result.addAll(stores.stores);
    }
    _items = result;
  }
}
