
import 'package:go_router/go_router.dart';

bool locationContains(context, String string) =>
    GoRouterState.of(context).uri.toString().contains(string);

Map<String, String> getPathParameters(context) =>
    GoRouterState.of(context).pathParameters;

Object? getExtra(context) => GoRouterState.of(context).extra;