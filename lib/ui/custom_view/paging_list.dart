import 'package:flutter/material.dart';

class PagingListCustom extends StatefulWidget {
  const PagingListCustom({
    Key? key,
    this.onRefresh,
    this.onScrollDown,
    required this.childWidget,
    this.isEmpty = false,
  }) : super(key: key);
  final ValueChanged<int>? onScrollDown;
  final ValueChanged<int>? onRefresh;
  final List<Widget> childWidget;
  final bool isEmpty;

  @override
  _PagingListState createState() => _PagingListState();
}

class _PagingListState extends State<PagingListCustom>
    with SingleTickerProviderStateMixin {
  int _page = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (widget.isEmpty) {
        return;
      }
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _page++;
        if (widget.onScrollDown != null) {
          widget.onScrollDown!(_page);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _page = 0;
        if (widget.onRefresh != null) widget.onRefresh!(_page);
      },
      child: ListView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        children: widget.childWidget,
      ),
    );
  }
}
