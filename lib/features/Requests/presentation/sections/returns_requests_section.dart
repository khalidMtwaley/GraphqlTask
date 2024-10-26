import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:task/core/di/service_locator.dart';
import 'package:task/core/theme/colors_manager.dart';
import 'package:task/core/theme/styles.dart';
import 'package:task/features/Requests/presentation/blocs/cubit/requests_cubit.dart';
import 'package:task/features/Requests/presentation/widgets/new_request_item.dart';

class ReturnsRequestsSection extends StatefulWidget {
  const ReturnsRequestsSection({Key? key}) : super(key: key);

  @override
  State<ReturnsRequestsSection> createState() => _ReturnsRequestsSectionState();
}

class _ReturnsRequestsSectionState extends State<ReturnsRequestsSection> {
  final ScrollController _scrollController = ScrollController();
  late RequestsCubit requestsCubit;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (requestsCubit.state is GetAllRequestsSuccess &&
          (requestsCubit.state as GetAllRequestsSuccess).hasMore) {
        requestsCubit.getAllRequests(isLoadMore: true, codeType: "RTRN");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl.get<RequestsCubit>()..getAllRequests(codeType: "RTRN"),
      child: Builder(
        builder: (context) {
          requestsCubit = BlocProvider.of<RequestsCubit>(context);

          return BlocBuilder<RequestsCubit, RequestsState>(
            builder: (context, state) {
              if (state is GetAllRequestsLoading && !state.isLoadMore) {
                return Center(
                  child: SpinKitFadingCircle(
                    color: ColorsManager.red,
                    size: 60.sp,
                  ),
                );
              } else if (state is GetAllRequestsSuccess) {
                if (state.allRequests.isEmpty) {
                  return Center(
                      child: Text(
                    "No payment requests available",
                    style:
                        Styles.Rubic500(fontSize: 20, color: ColorsManager.red),
                  ));
                }
                return ListView.builder(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                  controller: _scrollController,
                  itemCount: state.allRequests.length + 1,
                  itemBuilder: (context, index) {
                    if (index < state.allRequests.length) {
                      return NewRequestItem(
                        requesst: state.allRequests[index],
                      );
                    } else {
                      return state.hasMore
                          ? Center(
                              child: SpinKitFadingCircle(
                                color: ColorsManager.red,
                                size: 60.0.sp,
                              ),
                            )
                          : const SizedBox();
                    }
                  },
                );
              } else if (state is GetAllRequestsFailed) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              return const Center(child: Text("No payment requests available"));
            },
          );
        },
      ),
    );
  }
}
