namespace TddBankingApp
{
    using TddBankingApp.Commands;

    public class CurrencyHandler : UndoRedoStack<ICurrency>
    {
        public ICurrency Add(IBank bank, ICurrency augend, ICurrency addend)
        {
            var newAdd = new AddCurrencyCommand(augend);
            return this.Do(newAdd, bank, addend);
        }

        public ICurrency Multiply(IBank bank, ICurrency multiplicand, ICurrency multiplier)
        {
            var newMultiply = new MultiplyCurrencyCommand(multiplicand);
            return this.Do(newMultiply, bank, multiplier);
        }

    }
}
