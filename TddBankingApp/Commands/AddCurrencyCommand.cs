namespace TddBankingApp.Commands
{
    using System.Linq;

    public class AddCurrencyCommand : CurrencyCommand
    {
        public AddCurrencyCommand(ICurrency augend)
            : base(augend) { }

        public override ICurrency Do(IBank bank, ICurrency addend)
        {
            var localArguments = this.ConvertArgumentsToLocal(bank, this.OriginalValue, addend);
            if (localArguments == null) { return null; }

            var sum = localArguments.Sum(argument => argument.Amount);
            return bank.InternalCurrency(sum);
        }

    }
}
