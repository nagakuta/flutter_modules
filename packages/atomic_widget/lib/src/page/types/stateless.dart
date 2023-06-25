part of "../widget.dart";

/// Page Widget
abstract base class PageWidget extends StatelessWidget {
  // ignore: public_member_api_docs
  const PageWidget({
    super.key,
  });

  /// Build a scaffold body.
  Widget buildBody(final BuildContext context);

  /// Build a scaffold.
  Scaffold buildMaterialScaffold(
    final BuildContext context, {
    required final Widget body,
    final PreferredSizeWidget? appBar,
    final Widget? floatingActionButton,
  }) {
    if (body is! TemplateWidget) {
      throw const AtomicWidgetException.shouldUseTemplateWidget();
    }

    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }

  /// Build a cupertino page scaffold.
  CupertinoPageScaffold? buildCupertinoScaffold(
    final BuildContext context, {
    required final Widget child,
    final ObstructingPreferredSizeWidget? navigationBar,
  }) {
    if (child is! TemplateWidget) {
      throw const AtomicWidgetException.shouldUseTemplateWidget();
    }

    return CupertinoPageScaffold(
      navigationBar: navigationBar,
      child: child,
    );
  }

  /// Build a app bar.
  PreferredSizeWidget? buildMaterialAppBar(final BuildContext context) => AppBar();

  /// Build a cupertino navigation bar.
  ObstructingPreferredSizeWidget? buildCupertinoNavigationBar(
    final BuildContext context,
  ) =>
      const CupertinoNavigationBar();

  /// Build a floating action button.
  Widget? buildMaterialFloatingActionButton(final BuildContext context) => null;

  @override
  Widget build(final BuildContext context) {
    final CupertinoPageScaffold? cupertinoPageScaffold = buildCupertinoScaffold(
      context,
      navigationBar: buildCupertinoNavigationBar(context),
      child: buildBody(context),
    );

    final Scaffold materialScaffold = buildMaterialScaffold(
      context,
      appBar: buildMaterialAppBar(context),
      body: buildBody(context),
      floatingActionButton: buildMaterialFloatingActionButton(context),
    );

    return CupertinoUserInterfaceLevel.maybeOf(context) != null
        ? cupertinoPageScaffold ?? materialScaffold
        : materialScaffold;
  }
}
