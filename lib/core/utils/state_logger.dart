import 'package:clean_todo/core/configs/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Useful to log state change in our application
/// Read the logs and you'll better understand what's going on under the hood
class StateLogger extends ProviderObserver {
  const StateLogger();
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.i('''
{
  provider: ${provider.name ?? provider.runtimeType},
  oldValue: $previousValue,
  newValue: $newValue
}
''');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
}
