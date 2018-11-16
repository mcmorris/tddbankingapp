namespace TddBankingApp
{
    using System.Collections.Generic;
    using System.Linq;

    public class MoneyFactory
    {
        protected CurrencyListing Currencies;

        public MoneyFactory(CurrencyListing currencyListing)
        {
            this.Currencies = currencyListing;
        }

        public IMoney Dollar(decimal amount)
        {
            return this.BuildMoney(amount, this.Currencies.GetCurrency("USD"));
        }

        public IMoney Franc(decimal amount)
        {
            return this.BuildMoney(amount, this.Currencies.GetCurrency("CHF"));
        }

        public IMoney Pound(decimal amount)
        {
            return this.BuildMoney(amount, this.Currencies.GetCurrency("GBP"));
        }

        public IMoney Euro(decimal amount)
        {
            return this.BuildMoney(amount, this.Currencies.GetCurrency("EUR"));
        }

        public IMoney Dong(decimal amount)
        {
            return this.BuildMoney(amount, this.Currencies.GetCurrency("VND"));
        }

        public IMoney Rial(decimal amount)
        {
            return this.BuildMoney(amount, this.Currencies.GetCurrency("IRR"));
        }

        public IMoney BuildMoney(decimal amount, ICurrency currency)
        {
            return new Money(amount, currency);
        }
    }
}
