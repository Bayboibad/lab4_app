import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tabbottom_event.dart';
part 'tabbottom_state.dart';

class TabbottomBloc extends Bloc<TabbottomEvent, TabbottomState> {
  TabbottomBloc() : super(ButtonTab(tabIndex: 0)) {
    on<TabBottom>((event, emit) {
            emit(ButtonTab(tabIndex: event.index));
    });
  }
}
