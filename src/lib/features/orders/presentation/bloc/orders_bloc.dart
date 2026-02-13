import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mpc/features/orders/domain/usecases/get_grouped_orders_use_case.dart';

import '../../domain/entities/order.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetGroupedOrdersUseCase getGroupedOrdersUseCase;

  OrdersBloc(this.getGroupedOrdersUseCase) : super(OrdersInitial()) {
    on<OrdersEvent>((event, emit) async {
      if (event is OrdersLoad) {
        emit(OrdersLoading());
        try {
          final orders = await getGroupedOrdersUseCase.execute();
          emit(OrdersLoaded(orders));
        } catch (e) {
          emit(OrdersFailed("Couldn't fetch orders"));
        }
      }
    });
  }
}

// Event
abstract class OrdersEvent {}

class OrdersLoad extends OrdersEvent {
  OrdersLoad();
}

// State
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState {
  final List<MapEntry<String, List<Order>>> orders;

  OrdersLoaded(this.orders);
}

class OrdersFailed extends OrdersState {
  final String message;

  OrdersFailed(this.message);
}
