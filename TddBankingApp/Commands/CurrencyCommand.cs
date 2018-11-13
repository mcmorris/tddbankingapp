namespace TddBankingApp.Commands
{
    using System.Collections.Generic;

    public abstract class CurrencyCommand : ICurrencyCommand<ICurrency>
    {
        protected ICurrency OriginalValue;

        protected CurrencyCommand(ICurrency originalValue)
        {
            this.OriginalValue = originalValue;
        }

        public abstract ICurrency Do(IBank bank, ICurrency addend);

        protected IList<ICurrency> ConvertArgumentsToLocal(
            IBank bank,
            ICurrency nonLocalAugend,
            ICurrency nonLocalAddend)
        {
            var localAugend = bank?.ConvertToLocal(nonLocalAugend);
            var localAddend = bank?.ConvertToLocal(nonLocalAddend);
            if (localAugend == null || localAddend == null) { return null; }

            return new List<ICurrency> { localAugend, localAddend };
        }

        public virtual ICurrency Undo(ICurrency addend)
        {
            return this.OriginalValue;
        }
    }
}
