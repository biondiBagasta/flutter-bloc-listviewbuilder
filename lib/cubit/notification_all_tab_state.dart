part of 'notification_all_tab_cubit.dart';

abstract class NotificationAllTabState extends Equatable {
  const NotificationAllTabState({
    required this.notifications
  });

  final List<Map<dynamic, dynamic>> notifications;

  @override
  List<Object> get props => [
    notifications
  ];
}

class NotificationAllTabInitial extends NotificationAllTabState {

  final List<Map<dynamic, dynamic>> notificationsInitialData;

  const NotificationAllTabInitial({ required this.notificationsInitialData }) 
  : super(notifications: notificationsInitialData);
}
