import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../../app.dart';
import 'bloc/upload_profile.dart';
  
@RoutePage()
class UploadProfilePage extends StatefulWidget {
  const UploadProfilePage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _UploadProfilePageState();
  }
}

class _UploadProfilePageState extends BasePageState<UploadProfilePage, UploadProfileBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const UploadProfilePageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<UploadProfileBloc, UploadProfileState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return const Text('Register');
          },
        ),
      ),
    );
  }
}
