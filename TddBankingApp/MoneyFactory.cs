namespace TddBankingApp
{
    public static class MoneyFactory
    {
        public static ICurrency Dollar(decimal amount)
        {
            return BuildCurrency(amount, "USD");
        }

        public static ICurrency Franc(decimal amount)
        {
            return BuildCurrency(amount, "CHF");
        }

        public static ICurrency BuildCurrency(decimal amount, string code) { return new Currency(amount, code); }
    }
}
