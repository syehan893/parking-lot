abstract class CommandExecutor<Type, Payload> {
  Type execute(Payload input);
}

class NoParam {}
