namespace TddBankingApp.Commands
{
    using System.Linq;

    public class MultiplyCurrencyCommand : CurrencyCommand
    {
        public MultiplyCurrencyCommand(ICurrency multiplicand)
            : base(multiplicand) { }

        public override ICurrency Do(IBank bank, ICurrency multiplier)
        {
            var localArguments = this.ConvertArgumentsToLocal(bank, this.OriginalValue, multiplier);
            if (localArguments == null) { return null; }

            var product = localArguments.Select(c => c.Amount).Aggregate((multi, next) => multi * next);
            return bank.InternalCurrency(product);
        }
    }
}
