namespace TddBankingApp.Commands
{
    using System.Collections.Generic;

    // Thanks to: https://www.cambiaresearch.com/articles/82/generic-undoredo-stack-in-csharp
    public class UndoRedoStack<T>
    {
        protected Stack<IMoneyCommand<T>> UndoStack;
        protected Stack<IMoneyCommand<T>> RedoStack;

        public UndoRedoStack()
        {
            this.Reset();
        }

        public void Reset()
        {
            this.UndoStack = new Stack<IMoneyCommand<T>>();
            this.RedoStack = new Stack<IMoneyCommand<T>>();
        }

        public T Do(IMoneyCommand<T> command, IBank bank, T input)
        {
            var output = command.Do(bank, input);
            this.UndoStack.Push(command);
            this.RedoStack.Clear();
            return output;
        }

        public T Undo(T input)
        {
            if (this.UndoStack.Count < 1) { return input; }

            var command = this.UndoStack.Pop();
            var output = command.Undo(input);
            this.RedoStack.Push(command);
            return output;
        }

        public T Redo(IBank bank, T input)
        {
            if (this.RedoStack.Count < 1) { return input; }

            var command = this.RedoStack.Pop();
            var output = command.Do(bank, input);
            this.UndoStack.Push(command);
            return output;
        }
    }
}
