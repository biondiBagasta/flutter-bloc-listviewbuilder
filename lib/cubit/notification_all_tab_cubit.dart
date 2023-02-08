import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notification_all_tab_state.dart';

class NotificationAllTabCubit extends Cubit<NotificationAllTabState> {
  final List<Map<dynamic, dynamic>> notificationsData;

  NotificationAllTabCubit({ required this.notificationsData}) 
  : super(NotificationAllTabInitial(notificationsInitialData: notificationsData));

  void removeNotificationsData(int index) {
    final newState = state.notifications..removeAt(index);
    print(newState.length);
    emit(NotificationAllTabInitial(
      notificationsInitialData: [...newState]
      )
    );
  }
}
