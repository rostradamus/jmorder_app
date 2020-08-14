import 'package:jmorder_app/bloc/bottom_navigation/bottom_navigation_event.dart';
import 'package:jmorder_app/bloc/bottom_navigation/bottom_navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  int currentIndex = 0;

  BottomNavigationBloc(BottomNavigationState initialState)
      : super(initialState);

  @override
  Stream<BottomNavigationState> mapEventToState(
    BottomNavigationEvent event,
  ) async* {
    if (event is MainPageCreated) {
      this.add(PageTapped(index: 0));
    }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: event.index);
      yield ViewLoading();

      switch (this.currentIndex) {
        case 0:
          {
            yield StaffsViewState();
            break;
          }
        case 1:
          {
            yield ChatViewState();
            break;
          }
        case 2:
          {
            yield OrdersViewState();
            break;
          }
        case 3:
          {
            yield ClientsViewState();
            break;
          }
        case 4:
          {
            yield SettingsViewState();
            break;
          }
        default:
          {}
      }
    }
  }
}
