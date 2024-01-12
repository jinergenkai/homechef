import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../../app.dart';
import 'bloc/choose_address.dart';
  
@RoutePage()
class ChooseAddressPage extends StatefulWidget {
  const ChooseAddressPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _ChooseAddressPageState();
  }
}

class _ChooseAddressPageState extends BasePageState<ChooseAddressPage, ChooseAddressBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const ChooseAddressPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<ChooseAddressBloc, ChooseAddressState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return const Text('Register');
          },
        ),
      ),
    );
  }
}
