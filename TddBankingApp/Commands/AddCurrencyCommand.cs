namespace TddBankingApp.Commands
{
    public class AddCurrencyCommand : ICurrencyCommand<ICurrency>
    {
        protected ICurrency OriginalValue;

        public AddCurrencyCommand(ICurrency augend)
        {
            this.OriginalValue = augend;
        }

        public ICurrency Do(IBank bank, ICurrency addend)
        {
            var localAugend = bank?.ConvertToLocal(this.OriginalValue);
            var localAddend = bank?.ConvertToLocal(addend);
            if (localAugend == null || localAddend == null) { return null; }

            return MoneyFactory.BuildCurrency(localAugend.Amount + localAddend.Amount, localAugend.Code);
        }

        public ICurrency Undo(ICurrency addend)
        {
            return this.OriginalValue;
        }
    }
}
