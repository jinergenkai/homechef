import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../../app.dart';
import 'bloc/in_processing_order.dart';
  
@RoutePage()
class InProcessingOrderPage extends StatefulWidget {
  const InProcessingOrderPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _InProcessingOrderPageState();
  }
}

class _InProcessingOrderPageState extends BasePageState<InProcessingOrderPage, InProcessingOrderBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const InProcessingOrderPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<InProcessingOrderBloc, InProcessingOrderState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return const Text('Register');
          },
        ),
      ),
    );
  }
}
