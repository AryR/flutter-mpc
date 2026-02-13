import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mpc/features/orders/data/repositories/orders_services_impl.dart';
import 'package:flutter_mpc/features/orders/domain/entities/order_status.dart';
import 'package:flutter_mpc/features/orders/domain/entities/order_type.dart';
import 'package:flutter_mpc/features/orders/domain/usecases/get_grouped_orders_use_case.dart';
import 'package:flutter_mpc/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:flutter_mpc/widgets/service_point_selector_widget.dart';
import 'package:flutter_mpc/features/orders/domain/entities/order.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrdersBloc(GetGroupedOrdersUseCase(OrdersServicesImpl())),
      child: const _OrdersWidget(),
    );
  }
}

class _OrdersWidget extends StatelessWidget {
  const _OrdersWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ServicePointSelectorWidget(
          servicePoint: ServicePoint(
            entity: "entity",
            center: "center",
            servicePoint: "servicePoint",
          ),
        ),
      ),
      floatingActionButton: _NewOrderPopupMenuWidget(),
      body: const _OrdersListWidget(),
    );
  }
}

class _OrdersListWidget extends StatelessWidget {
  const _OrdersListWidget();

  @override
  Widget build(BuildContext context) {
    if (context.select((OrdersBloc bloc) => bloc.state is OrdersInitial)) {
      context.read<OrdersBloc>().add(OrdersLoad());

      return const Center(child: CircularProgressIndicator());
    } else if (context.select(
      (OrdersBloc bloc) => bloc.state is OrdersLoading,
    )) {
      return const Center(child: CircularProgressIndicator());
    } else if (context.select(
      (OrdersBloc bloc) => bloc.state is OrdersFailed,
    )) {
      final message = context.select(
        (OrdersBloc bloc) => (bloc.state as OrdersFailed).message,
      );
      return Center(child: Text('Error: $message'));
    } else if (context.select(
      (OrdersBloc bloc) => bloc.state is OrdersLoaded,
    )) {
      final sortedEntries = context.select(
        (OrdersBloc bloc) => (bloc.state as OrdersLoaded).orders,
      );

      return ListView.builder(
        itemBuilder: (context, index) => ExpansionTile(
          title: Text(sortedEntries[index].key),
          initiallyExpanded: index == 0,
          children: sortedEntries[index].value
              .map((item) => _OrderWidget(order: item))
              .toList(),
        ),
        itemCount: sortedEntries.length,
      );
    }

    return const Center(child: Text('No se encontraron órdenes.'));
  }
}

class _OrderWidget extends StatelessWidget {
  const _OrderWidget({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 10,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Icon(order.serviceType.icon, size: 32),
                    Text(
                      order.serviceType.displayName,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Text(
                      order.serviceCode,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${order.requestedTime.day}/${order.requestedTime.month}/${order.requestedTime.year} ${order.requestedTime.hour.toString().padLeft(2, '0')}:${order.requestedTime.minute.toString().padLeft(2, '0')}',
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: order.serviceStatusCode.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: order.serviceStatusCode.color,
                          ),
                        ),
                        child: Text(
                          order.serviceStatusDescription,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: order.serviceStatusCode.color,
                                fontWeight: FontWeight.bold,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewOrderPopupMenuWidget extends StatelessWidget {
  const _NewOrderPopupMenuWidget();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: PopupMenuButton<OrderType>(
        icon: const Icon(Icons.add),
        onSelected: (OrderType result) {
          // Navigate to new Order page
        },
        itemBuilder: (context) => OrderType.values.map((OrderType orderType) {
          return PopupMenuItem<OrderType>(
            value: orderType,
            child: Row(
              children: [
                Icon(orderType.icon, color: Theme.of(context).primaryColor),
                const SizedBox(width: 10),
                Text(orderType.displayName),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
