import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../../app.dart';
import 'bloc/create_address.dart';
  
@RoutePage()
class CreateAddressPage extends StatefulWidget {
  const CreateAddressPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _CreateAddressPageState();
  }
}

class _CreateAddressPageState extends BasePageState<CreateAddressPage, CreateAddressBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const CreateAddressPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<CreateAddressBloc, CreateAddressState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return const Text('Register');
          },
        ),
      ),
    );
  }
}
