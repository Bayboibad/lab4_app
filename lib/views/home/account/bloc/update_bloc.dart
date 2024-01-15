import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab4_app/api/firebase_store.dart';
import 'package:lab4_app/models/fav.dart';
import 'package:lab4_app/models/users.dart';
import 'package:meta/meta.dart';

part 'update_event.dart';
part 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  FirebaseAccount auth;
  UpdateBloc({required this.auth}) : super(UpdateInitial()) {
    on<ButtonUpdate>((event, emit) {
      if (event.email.isEmpty) {}
    });

    on<ButtonDate>((event, emit) {
      try {
        if (event.userId.isEmpty) {
          emit(ErrorUpdate(error: "Không để trống dữ liệu"));
        } else {
          final data = auth.getData(event.userId);
          emit(DataUser(username: data.toString(), email: data.toString()));
        }
      } catch (e) {
        throw (e);
      }
    });

    on<ButtonLove>((event, emit) async {
      try {
        if (event.userId.isEmpty) {
          emit(ErrorUpdate(error: "Thiếu Dữ liệu"));
          print("Thiếu Dữ liệu");
        } else {
          UserModel user =
              await auth.getUser(FirebaseAuth.instance.currentUser!.uid);
          await auth.addFavourite(
              event.productId.toString(), event.userId.toString());
          print("Bloc Update  ${user.favourite}");
          emit(ButtonLoveState(favorite: user.favourite));
        }
      } catch (e) {
        emit(ErrorUpdate(error: "Lỗi khi lấy dữ liệu người dùng: $e"));
      }
    });

   on<ButtonFav>((event, emit) async {
     if(event.id.isEmpty){
       emit(ErrorUpdate(error: "Không để trống"));
     }else{
       try {
         await auth.deleteLoveData(event.id);
         emit(SumitDelFav());
       }catch(e){throw(e);}
       }

   });
  }
}
