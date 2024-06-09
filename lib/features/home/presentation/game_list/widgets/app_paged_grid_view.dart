import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AppPagedGridView<PageKeyType, ItemType> extends StatefulWidget {
  final PagingController<PageKeyType, ItemType> pagingController;
  final ItemWidgetBuilder<ItemType> itemBuilder;
  final void Function(PageKeyType) pageRequest;
  final WidgetBuilder? firstPageProgressIndicatorBuilder;
  final WidgetBuilder? newPageProgressIndicatorBuilder;
  final WidgetBuilder? firstPageErrorIndicatorBuilder;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final SliverGridDelegate gridDelegate;

  const AppPagedGridView({
    super.key,
    required this.pagingController,
    required this.itemBuilder,
    required this.pageRequest,
    this.shrinkWrap = false,
    this.firstPageProgressIndicatorBuilder,
    this.newPageProgressIndicatorBuilder,
    this.physics,
    this.padding,
    this.firstPageErrorIndicatorBuilder,
    required this.gridDelegate,
  });

  @override
  State<AppPagedGridView> createState() =>
      _AppPagedGridViewState<PageKeyType, ItemType>();
}

class _AppPagedGridViewState<PageKeyType, ItemType>
    extends State<AppPagedGridView<PageKeyType, ItemType>> {
  @override
  void initState() {
    widget.pagingController.addPageRequestListener(widget.pageRequest);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedGridView<PageKeyType, ItemType>(
      padding: widget.padding,
      pagingController: widget.pagingController,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      builderDelegate: PagedChildBuilderDelegate<ItemType>(
        itemBuilder: widget.itemBuilder,
        firstPageProgressIndicatorBuilder:
            widget.firstPageProgressIndicatorBuilder,
        newPageProgressIndicatorBuilder: widget.newPageProgressIndicatorBuilder,
        firstPageErrorIndicatorBuilder: widget.firstPageErrorIndicatorBuilder,
      ),
      gridDelegate: widget.gridDelegate,
    );
  }
}
