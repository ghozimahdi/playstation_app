import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AppPagedListView<PageKeyType, ItemType> extends StatefulWidget {
  final PagingController<PageKeyType, ItemType> pagingController;
  final ItemWidgetBuilder<ItemType> itemBuilder;
  final void Function(PageKeyType) pageRequest;
  final WidgetBuilder? firstPageProgressIndicatorBuilder;
  final WidgetBuilder? newPageProgressIndicatorBuilder;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;

  const AppPagedListView({
    super.key,
    required this.pagingController,
    required this.itemBuilder,
    required this.pageRequest,
    this.shrinkWrap = false,
    this.firstPageProgressIndicatorBuilder,
    this.newPageProgressIndicatorBuilder,
    this.physics,
    this.padding,
  });

  @override
  State<AppPagedListView> createState() =>
      _AppPagedListViewState<PageKeyType, ItemType>();
}

class _AppPagedListViewState<PageKeyType, ItemType>
    extends State<AppPagedListView<PageKeyType, ItemType>> {
  @override
  void initState() {
    widget.pagingController.addPageRequestListener(widget.pageRequest);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<PageKeyType, ItemType>(
      padding: widget.padding,
      pagingController: widget.pagingController,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      builderDelegate: PagedChildBuilderDelegate<ItemType>(
        itemBuilder: widget.itemBuilder,
        firstPageProgressIndicatorBuilder:
            widget.firstPageProgressIndicatorBuilder,
        newPageProgressIndicatorBuilder: widget.newPageProgressIndicatorBuilder,
      ),
    );
  }
}
