part of 'show_hide_password_cubit.dart';

abstract class ShowHidePasswordState extends Equatable {
  const ShowHidePasswordState({ required this.isShowedPassword });

  final bool isShowedPassword;
  @override
  List<Object> get props => [
    isShowedPassword
  ];
}

class ShowHidePasswordInitial extends ShowHidePasswordState {

  final bool showHidePasswordState;

  const ShowHidePasswordInitial({ required this.showHidePasswordState }) : 
  super(isShowedPassword: showHidePasswordState);
}
