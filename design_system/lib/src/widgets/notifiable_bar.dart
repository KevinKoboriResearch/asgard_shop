import 'package:equatable/equatable.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class AppNotification extends Equatable {
  const AppNotification({
    required this.title,
    required this.description,
    required this.icon,
  });
  final String title;
  final String description;
  final String icon;

  @override
  List<Object?> get props => [
        title,
        description,
        icon,
      ];
}

class AppNotifiableBar extends StatefulWidget {
  const AppNotifiableBar({
    required this.child,
    Key? key,
    this.notification,
    this.onClosed,
  }) : super(key: key);

  final AppNotification? notification;
  final VoidCallback? onClosed;
  final Widget child;

  @override
  State<AppNotifiableBar> createState() => _AppNotifiableBarState();
}

class _AppNotifiableBarState extends State<AppNotifiableBar> {
  late bool _isOpened = widget.notification != null;

  @override
  void didUpdateWidget(covariant AppNotifiableBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.notification != widget.notification) {
      setState(() {
        _isOpened = widget.notification != null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isOpened
        ? AppNotifiableBarLayout.opened(
            notification: widget.notification,
            onClosed: () {
              setState(() {
                _isOpened = false;
              });
              widget.onClosed?.call();
            },
            child: widget.child,
          )
        : AppNotifiableBarLayout.closed(
            child: widget.child,
          );
  }
}

enum AppNotifiableBarState {
  opened,
  closed,
}

class AppNotifiableBarLayout extends StatelessWidget {
  const AppNotifiableBarLayout.opened({
    required this.notification,
    required this.child,
    Key? key,
    this.onClosed,
  })  : _state = AppNotifiableBarState.opened,
        super(key: key);

  const AppNotifiableBarLayout.closed({
    required this.child,
    Key? key,
    this.onClosed,
  })  : _state = AppNotifiableBarState.closed,
        notification = null,
        super(key: key);

  final AppNotifiableBarState _state;
  final AppNotification? notification;
  final VoidCallback? onClosed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final notification = this.notification;
    final isOpened =
        notification != null || _state == AppNotifiableBarState.opened;

    return AnimatedContainer(
      duration: theme.durations.regular,
      decoration: BoxDecoration(
        borderRadius: theme.radius.asBorderRadius().regular,
        color: theme.colors.accent,
        boxShadow: [
          BoxShadow(
            blurRadius: isOpened ? 30 : 0,
            color: theme.colors.accent.withOpacity(
              isOpened ? 0.5 : 0.0,
            ),
          )
        ],
      ),
      child: AnimatedSize(
        duration: theme.durations.regular,
        alignment: Alignment.bottomCenter,
        curve: Curves.easeInOut,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isOpened)
              _NotificationBody(
                notification: notification!,
                onClose: onClosed,
              ),
            child,
          ],
        ),
      ),
    );
  }
}

class _NotificationBody extends StatelessWidget {
  const _NotificationBody({
    required this.notification,
    Key? key,
    this.onClose,
  }) : super(key: key);

  final AppNotification notification;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Row(
      children: [
        AppPadding(
          padding: const AppEdgeInsets.regular(),
          child: AppIcon.regular(
            notification.icon,
            color: theme.colors.accentOpposite,
          ),
        ),
        Expanded(
          child: AppPadding(
            padding: const AppEdgeInsets.symmetric(
              vertical: AppGapSize.medium,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppText.title3(
                  notification.title,
                  color: theme.colors.accentOpposite,
                  maxLines: 1,
                ),
                AppText.paragraph1(
                  notification.description,
                  color: theme.colors.accentOpposite,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
        AppActionButton(
          icon: theme.icons.characters.dismiss,
          onTap: onClose,
        ),
      ],
    );
  }
}
