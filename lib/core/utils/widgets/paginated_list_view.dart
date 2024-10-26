// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// class PaginatedListView<T, C extends Cubit<S>, S> extends StatefulWidget {
//   final C cubit;
//   final ScrollController scrollController;
//   final Function(bool isLoadMore) fetchItems;
//   final Widget Function(BuildContext, T) itemBuilder;
//   final bool Function(S state) isLoading;
//   final bool Function(S state) hasMoreItems;
//   final List<T> Function(S state) getItems;
//   final String emptyMessage;
//   final Color loadingIndicatorColor;

//   const PaginatedListView({
//     Key? key,
//     required this.cubit,
//     required this.scrollController,
//     required this.fetchItems,
//     required this.itemBuilder,
//     required this.isLoading,
//     required this.hasMoreItems,
//     required this.getItems,
//     this.emptyMessage = "No items available",
//     this.loadingIndicatorColor = Colors.blue,
//   }) : super(key: key);

//   @override
//   _PaginatedListViewState<T, C, S> createState() => _PaginatedListViewState<T, C, S>();
// }

// class _PaginatedListViewState<T, C extends Cubit<S>, S> extends State<PaginatedListView<T, C, S>> {
//   @override
//   void initState() {
//     super.initState();
//     widget.scrollController.addListener(_onScroll);
//     widget.fetchItems(false); // Initial fetch
//   }

//   void _onScroll() {
//     if (widget.scrollController.position.pixels == widget.scrollController.position.maxScrollExtent) {
//       if (!widget.isLoading(context.read<C>().state) && widget.hasMoreItems(context.read<C>().state)) {
//         widget.fetchItems(true); // Fetch more items
//       }
//     }
//   }

//   @override
//   void dispose() {
//     widget.scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<C, S>(
//       bloc: widget.cubit,
//       builder: (context, state) {
//         final items = widget.getItems(state);

//         if (widget.isLoading(state) && items.isEmpty) {
//           return Center(child: SpinKitCircle(color: widget.loadingIndicatorColor, size: 30.0));
//         }

//         if (items.isEmpty) {
//           return Center(child: Text(widget.emptyMessage));
//         }

//         return ListView.builder(
//           controller: widget.scrollController,
//           itemCount: items.length + (widget.hasMoreItems(state) ? 1 : 0),
//           itemBuilder: (context, index) {
//             if (index < items.length) {
//               return widget.itemBuilder(context, items[index]);
//             } else {
//               return Center(child: SpinKitCircle(color: widget.loadingIndicatorColor, size: 30.0));
//             }
//           },
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PaginatedListView<C extends Cubit<S>, S> extends StatefulWidget {
  final C cubit;
  final ScrollController scrollController;
  final Function(bool isLoadMore) fetchItems;
  final Widget Function(BuildContext, S, int) itemBuilder; // Updated to include index
  final bool Function(S state) isLoading;
  final bool Function(S state) hasMoreItems;
  final List Function(S state) getItems;
  final String emptyMessage;
  final Color loadingIndicatorColor;

  const PaginatedListView({
    Key? key,
    required this.cubit,
    required this.scrollController,
    required this.fetchItems,
    required this.itemBuilder,
    required this.isLoading,
    required this.hasMoreItems,
    required this.getItems,
    this.emptyMessage = "No items available",
    this.loadingIndicatorColor = Colors.blue,
  }) : super(key: key);

  @override
  _PaginatedListViewState<C, S> createState() => _PaginatedListViewState<C, S>();
}

class _PaginatedListViewState<C extends Cubit<S>, S> extends State<PaginatedListView<C, S>> {
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
    widget.fetchItems(false); // Initial fetch
  }

  void _onScroll() {
    if (widget.scrollController.position.pixels == widget.scrollController.position.maxScrollExtent) {
      if (!widget.isLoading(context.read<C>().state) && widget.hasMoreItems(context.read<C>().state)) {
        widget.fetchItems(true); // Fetch more items
      }
    }
  }

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, S>(
      bloc: widget.cubit,
      builder: (context, state) {
        final items = widget.getItems(state);

        if (widget.isLoading(state) && items.isEmpty) {
          return Center(child: SpinKitCircle(color: widget.loadingIndicatorColor, size: 30.0));
        }

        if (items.isEmpty) {
          return Center(child: Text(widget.emptyMessage));
        }

        return ListView.builder(
          controller: widget.scrollController,
          itemCount: items.length + (widget.hasMoreItems(state) ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < items.length) {
              return widget.itemBuilder(context, state, index); // Pass state and index
            } else {
              return Center(child: SpinKitCircle(color: widget.loadingIndicatorColor, size: 30.0));
            }
          },
        );
      },
    );
  }
}
