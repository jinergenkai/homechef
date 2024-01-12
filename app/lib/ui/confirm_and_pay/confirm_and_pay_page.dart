import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../../app.dart';
import 'bloc/confirm_and_pay.dart';
  
@RoutePage()
class ConfirmAndPayPage extends StatefulWidget {
  const ConfirmAndPayPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _ConfirmAndPayPageState();
  }
}

class _ConfirmAndPayPageState extends BasePageState<ConfirmAndPayPage, ConfirmAndPayBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const ConfirmAndPayPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<ConfirmAndPayBloc, ConfirmAndPayState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return const Text('Register');
          },
        ),
      ),
    );
  }
}
