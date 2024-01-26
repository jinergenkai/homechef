import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../../app.dart';
import 'bloc/update_info.dart';
  
@RoutePage()
class UpdateInfoPage extends StatefulWidget {
  const UpdateInfoPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _UpdateInfoPageState();
  }
}

class _UpdateInfoPageState extends BasePageState<UpdateInfoPage, UpdateInfoBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const UpdateInfoPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<UpdateInfoBloc, UpdateInfoState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return const Text('Register');
          },
        ),
      ),
    );
  }
}
