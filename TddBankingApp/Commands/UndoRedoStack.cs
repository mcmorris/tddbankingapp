namespace TddBankingApp.Commands
{
    using System.Collections.Generic;

    // Thanks to: https://www.cambiaresearch.com/articles/82/generic-undoredo-stack-in-csharp
    public class UndoRedoStack<T>
    {
        protected Stack<ICurrencyCommand<T>> undoStack;
        protected Stack<ICurrencyCommand<T>> redoStack;

        public UndoRedoStack()
        {
            this.Reset();
        }

        public void Reset()
        {
            this.undoStack = new Stack<ICurrencyCommand<T>>();
            this.redoStack = new Stack<ICurrencyCommand<T>>();
        }

        public T Do(ICurrencyCommand<T> command, IBank bank, T input)
        {
            var output = command.Do(bank, input);
            this.undoStack.Push(command);
            this.redoStack.Clear();
            return output;
        }

        public T Undo(T input)
        {
            if (this.undoStack.Count <= 0) { return input; }

            var command = this.undoStack.Pop();
            var output = command.Undo(input);
            this.redoStack.Push(command);
            return output;
        }

        public T Redo(IBank bank, T input)
        {
            if (this.redoStack.Count < 1) { return input; }

            var command = this.redoStack.Pop();
            var output = command.Do(bank, input);
            this.undoStack.Push(command);
            return output;
        }
    }
}
