import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'show_hide_password_state.dart';

class ShowHidePasswordCubit extends Cubit<ShowHidePasswordState> {
  ShowHidePasswordCubit() : super(const ShowHidePasswordInitial(showHidePasswordState: false));

  void showHidePassword() {
    emit(ShowHidePasswordInitial(showHidePasswordState: !state.isShowedPassword));
  }
}
