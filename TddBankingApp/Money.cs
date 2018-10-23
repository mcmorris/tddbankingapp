namespace TddBankingApp
{
    public class Money
    {
        protected decimal amount;

        public Money(decimal amount)
        {
            this.amount = amount;
        }

        public Money Times(int multiplier)
        {
            return new Money(this.amount * multiplier);
        }

        public override bool Equals(object other)
        {
            var otherMoney = (Money)other;
            return this.amount == otherMoney?.amount;
        }
    }
}
