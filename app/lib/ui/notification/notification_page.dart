import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../../app.dart';
import 'bloc/notification.dart';
  
@RoutePage()
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _NotificationPageState();
  }
}

class _NotificationPageState extends BasePageState<NotificationPage, NotificationBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const NotificationPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<NotificationBloc, NotificationState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return const Text('Register');
          },
        ),
      ),
    );
  }
}
