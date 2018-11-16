namespace TddBankingApp.Commands
{
    using System.Collections.Generic;

    public abstract class MoneyCommand : IMoneyCommand<IMoney>
    {
        protected IMoney OriginalValue;

        protected MoneyCommand(IMoney originalValue)
        {
            this.OriginalValue = originalValue;
        }

        public abstract IMoney Do(IBank bank, IMoney addend);

        protected IList<IMoney> ConvertArgumentsToLocal(
            IBank bank,
            IMoney nonLocalAugend,
            IMoney nonLocalAddend)
        {
            var localAugend = bank?.ConvertToLocal(nonLocalAugend);
            var localAddend = bank?.ConvertToLocal(nonLocalAddend);
            if (localAugend == null || localAddend == null) { return null; }

            return new List<IMoney> { localAugend, localAddend };
        }

        public virtual IMoney Undo(IMoney addend)
        {
            return this.OriginalValue;
        }
    }
}
