import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_kop_sq_mobile/cubit/show_hide_password_cubit.dart';

class MockShowHidePasswordCubit extends MockCubit<ShowHidePasswordState> implements ShowHidePasswordCubit {} 
void main() {
  group('Show Hide Password Cubit', () { 
    late ShowHidePasswordCubit showHidePasswordCubit;

    setUp(() {
      showHidePasswordCubit = ShowHidePasswordCubit();
    });

    test('initial isShowedPassword state is false', () {
      expect(showHidePasswordCubit.state.isShowedPassword, false);
    });

    blocTest<ShowHidePasswordCubit, ShowHidePasswordState>('isShowedPasssword state is changed', 
      build: () => showHidePasswordCubit,
      act: (cubit) => cubit.showHidePassword(),
      expect: () => [const ShowHidePasswordInitial(showHidePasswordState: true)]
    );
  });
}
