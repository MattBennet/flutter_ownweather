import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_ownweather/presentation/splash_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ownweather/presentation/splash_state.dart';
import 'package:flutter_ownweather/screens/city_screen.dart';
import 'package:flutter_ownweather/utils/Images.dart';
import 'package:flutter_ownweather/utils/styles.dart';
import 'package:flutter_ownweather/widget/loader_widget.dart';
import 'package:flutter_ownweather/widget/retry_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();

  SplashScreen._();

  static Widget newInstance() {
    return BlocProvider(
      create: (_) => SplashCubit(),
      child: SplashScreen._(),
    );
  }
}

class _SplashScreenState extends State<SplashScreen> {
  SplashCubit get _cubit => BlocProvider.of(context);

  @override
  void initState() {
    _cubit.getCity();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bg,
      body: BlocBuilder<SplashCubit, SplashState>(
        builder: (ctx, state) {
          if (state is Error) {
            return RetryWidget.withMessage(
              message: state.message,
              textColor: Colors.white,
              callback: () {
                _cubit.getCity();
              },
            );
          }
          if (state is Success) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CityScreen.newInstance(state.city),
                ),
              );
            });
          }

          return Center(
            child: SpinKitDoubleBounce(
              color: Colors.white,
              size: 100.0,
            ),
          );
        },
      ),
    );
  }
}
