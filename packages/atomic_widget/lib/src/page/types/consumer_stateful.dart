part of "../widget.dart";

/// Consumer Stateful Page Widget
abstract base class ConsumerStatefulPageWidget extends ConsumerStatefulWidget {
  // ignore: public_member_api_docs
  const ConsumerStatefulPageWidget({
    super.key,
  });

  @override
  ConsumerPageState<ConsumerStatefulPageWidget> createState();
}

/// Consumer Stateful Page State
abstract class ConsumerPageState<T extends ConsumerStatefulPageWidget> extends ConsumerState<T> {
  /// Build a scaffold body.
  Widget buildBody(final BuildContext context, final WidgetRef ref);

  /// Build a scaffold.
  Scaffold buildMaterialScaffold(
    final BuildContext context,
    final WidgetRef ref, {
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
    final BuildContext context,
    final WidgetRef ref, {
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
  PreferredSizeWidget? buildMaterialAppBar(
    final BuildContext context,
    final WidgetRef ref,
  ) =>
      AppBar();

  /// Build a cupertino navigation bar.
  ObstructingPreferredSizeWidget? buildCupertinoNavigationBar(
    final BuildContext context,
    final WidgetRef ref,
  ) =>
      const CupertinoNavigationBar();

  /// Build a floating action button.
  Widget? buildMaterialFloatingActionButton(
    final BuildContext context,
    final WidgetRef ref,
  ) =>
      null;

  @override
  Widget build(final BuildContext context) {
    final CupertinoPageScaffold? cupertinoPageScaffold = buildCupertinoScaffold(
      context,
      ref,
      navigationBar: buildCupertinoNavigationBar(context, ref),
      child: buildBody(context, ref),
    );

    final Scaffold materialScaffold = buildMaterialScaffold(
      context,
      ref,
      appBar: buildMaterialAppBar(context, ref),
      body: buildBody(context, ref),
      floatingActionButton: buildMaterialFloatingActionButton(context, ref),
    );

    return CupertinoUserInterfaceLevel.maybeOf(context) != null
        ? cupertinoPageScaffold ?? materialScaffold
        : materialScaffold;
  }
}
