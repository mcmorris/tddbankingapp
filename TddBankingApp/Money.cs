namespace TddBankingApp
{
    public class Money
    {
        protected decimal amount;

        public string Currency;

        public Money(decimal amount, string currency)
        {
            this.amount = amount;
            this.Currency = currency;
        }

        public static Money Dollar(decimal amount)
        {
            return new Money(amount, "USD");
        }

        public static Money Franc(decimal amount)
        {
            return new Money(amount, "CHF");
        }

        public Money Times(int multiplier)
        {
            return new Money(this.amount * multiplier, Currency);
        }

        public override bool Equals(object other)
        {
            var otherMoney = (Money)other;
            return this.amount == otherMoney?.amount &&
                this.Currency == otherMoney?.Currency;
        }
    }
}
