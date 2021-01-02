import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_shop/model/home_entity.dart';
import 'package:flutter_shop/model/store_entity.dart';
import 'package:flutter_shop/provider/home_rovider.dart';
import 'package:flutter_shop/utils/app_size.dart';
import 'package:flutter_shop/view/theme_ui.dart';
import 'package:flutter_shop/widget/app_topbar.dart';
import 'package:flutter_shop/widget/customize_appbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  HomeProvider _homeProvider;

  @override
  void initState() {
    super.initState();
    _homeProvider = HomeProvider();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // 第一种通过value参数创建provider，value必须是已经创建的provider变量
    return ChangeNotifierProvider.value(
      value: _homeProvider,
      child: Scaffold(
        appBar: ShopAppBar(
          height: AppSize.height(55),
          child: HomeTopBar(),
        ),
        body: Container(
          color: Color(0xfff5f6f7),
          child: FutureBuilder<bool>(
            future: _homeProvider.isInit,
            initialData: false,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              switch (snapshot.connectionState) {
                // 未加载完成前
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                // 数据加载完成
                case ConnectionState.done:
                  if (snapshot.data) return _buildListView();
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  // 构造列表数据
  Widget _buildListView() {
    return Builder(builder: (ctx) {
      List<HomeListItem> data = ctx.watch<HomeProvider>().items;
      return EasyRefresh(
          header: ClassicalHeader(
            bgColor: ThemeColor.appBarBottomBg,
            refreshText: "下拉触发",
            textColor: Colors.white,
            refreshReadyText: "释放刷新",
            refreshingText: "刷新中...",
            refreshedText: "已刷新",
          ),
          footer: ClassicalFooter(
            bgColor: ThemeColor.appBg,
            textColor: ThemeColor.hintTextColor,
            loadText: "上拉触发",
            loadReadyText: "加载更多",
            loadingText: "正在加载",
            loadedText: "加载完成",
            noMoreText: "没有更多",
          ),
          onRefresh: () async {
            _homeProvider.update();
          },
          onLoad: () async {
            _homeProvider.update();
          },
          child: ListView.builder(
              itemCount: data?.length,
              itemBuilder: (ctx, position) {
                if (data[position] is HeadMenuItem) {
                  return _createHeadNav();
                } else if (data[position] is ScrollMenuItem) {
                  return _createScrollNav();
                } else if (data[position] is GridMenuItem) {
                  return _createGridNav();
                } else if (data[position] is AdBarItem) {
                  return _createAdBar();
                } else if (data[position] is OfferItem) {
                  return _createOfferBar();
                } else {
                  return _createNearbyStoreItem(
                      data[position] as StoreModel, position);
                }
              }));
    });
  }

  Widget _createHeadNav() {}

  Widget _createScrollNav() {}

  Widget _createGridNav() {}

  Widget _createAdBar() {}

  Widget _createOfferBar() {}

  Widget _createNearbyStoreItem(StoreModel data, int position) {}
}
