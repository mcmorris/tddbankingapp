namespace TddBankingApp.Commands
{
    public class MultiplyCurrencyCommand : ICurrencyCommand<ICurrency>
    {
        protected ICurrency OriginalValue;

        public MultiplyCurrencyCommand(ICurrency multiplicand)
        {
            this.OriginalValue = multiplicand;
        }

        public ICurrency Do(IBank bank, ICurrency multiplier)
        {
            var localMultiplicand = bank?.ConvertToLocal(this.OriginalValue);
            var localMultiplier = bank?.ConvertToLocal(multiplier);
            if (localMultiplicand == null || localMultiplier == null) { return null; }

            return MoneyFactory.BuildCurrency(localMultiplicand.Amount * localMultiplier.Amount, localMultiplicand.Code);
        }

        public ICurrency Undo(ICurrency addend)
        {
            return this.OriginalValue;
        }
    }
}
