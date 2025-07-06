import 'package:bloc/bloc.dart';
import 'package:main/core/enum/ui_state.dart';
import 'package:main/data/product/product_model.dart';
import 'package:main/domain/repository/main/impl/main_repository_impl.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final repository = MainRepositoryImpl();

  MainBloc() : super(MainState()) {
    on<GetProductsEvent>((event, emit) async {
      try {
        emit(state.copyWith(uiState: UIState.loading));
        final productList = await repository.getProducts();

        print("Get fetching products: $productList");
        if (productList.isEmpty) {
          emit(state.copyWith(uiState: UIState.empty));
        } else {
          emit(
            state.copyWith(uiState: UIState.success, productList: productList),
          );
        }
      } catch (error) {
        print("Error fetching products: $error");
        emit(
          state.copyWith(
            uiState: UIState.error,
            errorMessage: error.toString(),
          ),
        );
      }
    });
  }
}
