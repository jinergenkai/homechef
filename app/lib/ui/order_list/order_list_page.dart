import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../../app.dart';
import 'bloc/order_list.dart';
  
@RoutePage()
class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _OrderListPageState();
  }
}

class _OrderListPageState extends BasePageState<OrderListPage, OrderListBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const OrderListPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<OrderListBloc, OrderListState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return const Text('Register');
          },
        ),
      ),
    );
  }
}
