import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../../app.dart';
import 'bloc/chef_active_account.dart';
  
@RoutePage()
class ChefActiveAccountPage extends StatefulWidget {
  const ChefActiveAccountPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _ChefActiveAccountPageState();
  }
}

class _ChefActiveAccountPageState extends BasePageState<ChefActiveAccountPage, ChefActiveAccountBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const ChefActiveAccountPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<ChefActiveAccountBloc, ChefActiveAccountState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return const Text('Register');
          },
        ),
      ),
    );
  }
}
