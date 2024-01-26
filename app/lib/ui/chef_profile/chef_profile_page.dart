import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../../app.dart';
import 'bloc/chef_profile.dart';
  
@RoutePage()
class ChefProfilePage extends StatefulWidget {
  const ChefProfilePage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _ChefProfilePageState();
  }
}

class _ChefProfilePageState extends BasePageState<ChefProfilePage, ChefProfileBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const ChefProfilePageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<ChefProfileBloc, ChefProfileState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return const Text('Register');
          },
        ),
      ),
    );
  }
}
