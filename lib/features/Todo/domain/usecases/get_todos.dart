import 'package:clean_todo/core/contracts/usecase.dart';

import 'package:clean_todo/features/Todo/domain/repository/todo_repository.dart';
import 'package:riverpod/riverpod.dart';

import '../../data/repository/todo_repository_impl.dart';

class GetTodos extends NoParamsUseCase<FetchTodosEither> {
  final TodoRepository repository;

  GetTodos(this.repository);
  @override
  FetchTodosEither call() async {
    return repository.fetchTodos();
  }
}

final getTodosProvider = FutureProvider.autoDispose((ref) async {
  return await GetTodos(ref.watch(todoRepositoryProvider)).call();
});