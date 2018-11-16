namespace TddBankingApp
{
    using TddBankingApp.Commands;

    public class MoneyHandler : UndoRedoStack<IMoney>
    {
        public IMoney Add(IBank bank, IMoney augend, IMoney addend)
        {
            var newAdd = new AddMoneyCommand(augend);
            return this.Do(newAdd, bank, addend);
        }

        public IMoney Multiply(IBank bank, IMoney multiplicand, IMoney multiplier)
        {
            var newMultiply = new MultiplyMoneyCommand(multiplicand);
            return this.Do(newMultiply, bank, multiplier);
        }
    }
}
