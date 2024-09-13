import 'package:flutter/material.dart';

import '../../common/app_color.dart';

class CustomTabs extends StatefulWidget {
  const CustomTabs({
    super.key,
    required this.tabs,
    this.onTap,
    this.tabBarViews,
    this.height = 140,
    this.padding = const EdgeInsets.only(top: 40),
  });

  final double? height;

  final List<Widget> tabs;

  final List<Widget>? tabBarViews;

  final void Function(int)? onTap;

  final EdgeInsetsGeometry? padding;

  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 初始化 TabController 并传入 vsync
    _tabController = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    // 释放资源
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar.secondary(
          indicatorColor: AppColor.brand62A2B0,
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          labelColor: AppColor.brand62A2B0,
          unselectedLabelColor: const Color.fromRGBO(153, 153, 153, 1),
          dividerColor: const Color.fromRGBO(109, 119, 139, 0.3),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          labelPadding: const EdgeInsets.symmetric(vertical: 10),
          controller: _tabController,
          tabs: widget.tabs,
          onTap: widget.onTap,
        ),
        widget.tabBarViews != null
            ? Container(
                padding: widget.padding,
                height: widget.height,
                child: TabBarView(
                  controller: _tabController,
                  children: widget.tabBarViews!,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
