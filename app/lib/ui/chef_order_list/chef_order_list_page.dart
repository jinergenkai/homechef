import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../../app.dart';
import 'bloc/chef_order_list.dart';
  
@RoutePage()
class ChefOrderListPage extends StatefulWidget {
  const ChefOrderListPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _ChefOrderListPageState();
  }
}

class _ChefOrderListPageState extends BasePageState<ChefOrderListPage, ChefOrderListBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const ChefOrderListPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<ChefOrderListBloc, ChefOrderListState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return const Text('Register');
          },
        ),
      ),
    );
  }
}
