namespace TddBankingApp
{
    public class CurrencyFactory
    {
        public ICurrency Dollar(decimal amount)
        {
            return this.BuildCurrency(amount, "USD");
        }

        public ICurrency Franc(decimal amount)
        {
            return this.BuildCurrency(amount, "CHF");
        }

        public ICurrency BuildCurrency(decimal amount, string code) { return new Currency(amount, code); }
    }
}
