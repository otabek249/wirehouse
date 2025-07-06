part of 'main_bloc.dart';

class MainState {
  UIState? uiState;
  List<ProductModel>? productList;
  String? errorMessage;

  MainState({this.uiState, this.productList ,this.errorMessage});

  MainState copyWith({UIState? uiState, List<ProductModel>? productList, String? errorMessage}) {
    return MainState(
      uiState: uiState ?? this.uiState,
      productList: productList ?? this.productList,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }
}
