namespace TddBankingApp.Commands
{
    using System.Linq;

    public class AddMoneyCommand : MoneyCommand
    {
        public AddMoneyCommand(IMoney augend)
            : base(augend) { }

        public override IMoney Do(IBank bank, IMoney addend)
        {
            var localArguments = this.ConvertArgumentsToLocal(bank, this.OriginalValue, addend);
            if (localArguments == null) { return null; }

            var sum = localArguments.Sum(argument => argument.Amount);
            return bank.InternalMoney(sum);
        }

    }
}
