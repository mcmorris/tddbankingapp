namespace TddBankingApp
{
    using System.Runtime.CompilerServices;

    public class Currency
    {
        public decimal Amount { get; }
        public string Code { get; }

        public Currency(decimal amount, string code)
        {
            this.Amount = amount;
            this.Code = code;
        }

        public static Currency Dollar(decimal amount)
        {
            return new Currency(amount, "USD");
        }

        public static Currency Franc(decimal amount)
        {
            return new Currency(amount, "CHF");
        }
    }
}
