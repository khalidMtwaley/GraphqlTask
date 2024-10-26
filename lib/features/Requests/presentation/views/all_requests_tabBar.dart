import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/di/service_locator.dart';
import 'package:task/core/theme/colors_manager.dart';
import 'package:task/core/theme/styles.dart';
import 'package:task/features/Requests/presentation/blocs/cubit/requests_cubit.dart';
import 'package:task/features/Requests/presentation/sections/materials_requests_section.dart';
import 'package:task/features/Requests/presentation/sections/payment_requests_section.dart';
import 'package:task/features/Requests/presentation/sections/returns_requests_section.dart';
import 'package:task/features/Requests/presentation/views/home_screen.dart';
import 'package:task/main.dart';

class AllRequestsTabBar extends StatefulWidget {
  final String? initialCode;

  const AllRequestsTabBar({Key? key, this.initialCode}) : super(key: key);
  static const String routeName = '/requests';

  @override
  State<AllRequestsTabBar> createState() => _AllRequestsTabBarState();
}

class _AllRequestsTabBarState extends State<AllRequestsTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int initialTabIndex;

  @override
  void initState() {
    super.initState();
    sl.get<RequestsCubit>()..getAllRequests(codeType: "PMNT");
    initialTabIndex = _getInitialTabIndex(widget.initialCode);
    _tabController =
        TabController(length: 3, vsync: this, initialIndex: initialTabIndex);

    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _getInitialTabIndex(String? code) {
    switch (code) {
      case "PMNT":
        return 0;
      case "RTRN":
        return 1;
      case "MTRL":
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ColorsManager.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Requests",
            style: Styles.Rubic500(fontSize: 18, color: ColorsManager.red),
          ),
          leading: IconButton(
            onPressed: ()

             => Navigator.of(context).pushReplacementNamed(HomeScreen.routeName),
            icon: const Icon(Icons.arrow_back, color: ColorsManager.red),
          ),
          bottom: TabBar(
            controller: _tabController,
            indicator: const BoxDecoration(),
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            labelColor: ColorsManager.red,
            unselectedLabelColor: ColorsManager.borderColor,
            labelStyle: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 11.sp,
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
            tabs: [
              _buildTab("Payments", 0),
              _buildTab("Returns", 1),
              _buildTab("Materials", 2),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            PaymentRequestsSection(),
            ReturnsRequestsSection(),
            MaterialsRequestsSection()
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    bool isSelected = _tabController.index == index;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 1.h),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.w,
          color: isSelected ? ColorsManager.red : ColorsManager.borderColor,
        ),
        borderRadius: BorderRadius.circular(30.r),
        color: Colors.transparent,
      ),
      child: Tab(text: title),
    );
  }
}
