import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../../app.dart';
import 'bloc/done_order.dart';
  
@RoutePage()
class DoneOrderPage extends StatefulWidget {
  const DoneOrderPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _DoneOrderPageState();
  }
}

class _DoneOrderPageState extends BasePageState<DoneOrderPage, DoneOrderBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const DoneOrderPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<DoneOrderBloc, DoneOrderState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return const Text('Register');
          },
        ),
      ),
    );
  }
}
