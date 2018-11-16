namespace TddBankingApp.Commands
{
    using System.Linq;

    public class MultiplyMoneyCommand : MoneyCommand
    {
        public MultiplyMoneyCommand(IMoney multiplicand)
            : base(multiplicand) { }

        public override IMoney Do(IBank bank, IMoney multiplier)
        {
            var localArguments = this.ConvertArgumentsToLocal(bank, this.OriginalValue, multiplier);
            if (localArguments == null) { return null; }

            var product = localArguments.Select(c => c.Amount).Aggregate((multi, next) => multi * next);
            return bank.InternalMoney(product);
        }
    }
}
