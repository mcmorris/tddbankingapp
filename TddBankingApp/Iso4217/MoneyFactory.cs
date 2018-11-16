namespace TddBankingApp
{
    using System;

    public class MoneyFactory
    {
        protected ICurrencyListing Currencies;

        public MoneyFactory(ICurrencyListing currencyListing)
        {
            this.Currencies = currencyListing;
        }

        public IMoney Dollar(decimal amount)
        {
            return this.BuildMoney(amount, this.Currencies.GetCurrency("USD", DateTime.Now));
        }

        public IMoney Franc(decimal amount)
        {
            return this.BuildMoney(amount, this.Currencies.GetCurrency("CHF", DateTime.Now));
        }

        public IMoney Pound(decimal amount)
        {
            return this.BuildMoney(amount, this.Currencies.GetCurrency("GBP", DateTime.Now));
        }

        public IMoney Euro(decimal amount)
        {
            return this.BuildMoney(amount, this.Currencies.GetCurrency("EUR", DateTime.Now));
        }

        public IMoney Dong(decimal amount)
        {
            return this.BuildMoney(amount, this.Currencies.GetCurrency("VND", DateTime.Now));
        }

        public IMoney Rial(decimal amount)
        {
            return this.BuildMoney(amount, this.Currencies.GetCurrency("IRR", DateTime.Now));
        }

        public IMoney BuildMoney(decimal amount, ICurrency currency)
        {
            return new Money(amount, currency);
        }
    }
}
