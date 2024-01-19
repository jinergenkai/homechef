import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../../app.dart';
import 'bloc/chef_detail_task.dart';
  
class ChefDetailTaskPage extends StatefulWidget {
  const ChefDetailTaskPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _ChefDetailTaskPageState();
  }
}

class _ChefDetailTaskPageState extends BasePageState<ChefDetailTaskPage, ChefDetailTaskBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const ChefDetailTaskPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<ChefDetailTaskBloc, ChefDetailTaskState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return const Text('Register');
          },
        ),
      ),
    );
  }
}
