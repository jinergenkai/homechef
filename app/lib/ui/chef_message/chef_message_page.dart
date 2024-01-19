import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../../app.dart';
import 'bloc/chef_message.dart';
  
@RoutePage()
class ChefMessagePage extends StatefulWidget {
  const ChefMessagePage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _ChefMessagePageState();
  }
}

class _ChefMessagePageState extends BasePageState<ChefMessagePage, ChefMessageBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const ChefMessagePageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<ChefMessageBloc, ChefMessageState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return const Text('Register');
          },
        ),
      ),
    );
  }
}
