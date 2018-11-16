namespace TddBankingApp
{
    using System;
    
    public class Bank : MoneyFactory, IBank
    {
        private readonly IStockExchange stocks;
        private readonly ICurrency internalCurrency;

        public Bank(IStockExchange stocks, ICurrencyListing currencies, string internalCurrencyCode) 
            : base(currencies)
        {
            this.stocks = stocks;
            this.internalCurrency = currencies.GetCurrency(internalCurrencyCode, DateTime.Now);
        }

        public IExchangeRate GetInternalExchangeRate(string currencyFrom)
        {
            return this.stocks.GetExchangeRate(currencyFrom, this.internalCurrency.AlphabeticCode);
        }

        public IMoney ConvertToLocal(IMoney originalMoney)
        {
            if (originalMoney == null) { return null; }
            if (originalMoney.Currency == this.internalCurrency) { return originalMoney; }

            var exchangeRate = this.stocks.GetExchangeRate(originalMoney.Currency.AlphabeticCode, this.internalCurrency.AlphabeticCode);
            if (exchangeRate == null)
            {
                throw new InvalidOperationException(
                    "Missing exchange rate for '" + originalMoney.Currency.AlphabeticCode + "' to '" + this.internalCurrency.AlphabeticCode + "'");
            }

            var newValue = originalMoney.Amount * exchangeRate.ConversionRate;
            return this.InternalMoney(newValue);
        }

        public IMoney InternalMoney(decimal amount)
        {
            return this.BuildMoney(amount, this.internalCurrency);
        }
    }
}