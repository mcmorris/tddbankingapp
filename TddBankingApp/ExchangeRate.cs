namespace TddBankingApp
{
    using System;

    public class ExchangeRate : IExchangeRate
    {
        public decimal ConversionRate { get; }

        public string CurrencyFrom { get; }

        public string CurrencyTo { get; }

        public DateTime Effective { get; }

        public ExchangeRate(DateTime dateEffective, string currencyFrom, string currencyTo, decimal exchangeRate)
        {
            this.CurrencyFrom = currencyFrom;
            this.CurrencyTo = currencyTo;
            this.Effective = dateEffective;
            this.ConversionRate = exchangeRate;
        }

        public override bool Equals(object other)
        {
            var otherRate = (IExchangeRate)other;
            if ((this.CurrencyFrom + this.CurrencyTo) != (otherRate?.CurrencyFrom + otherRate?.CurrencyTo)) { return false; }
            return this.ConversionRate == otherRate?.ConversionRate && this.Effective.Ticks == otherRate.Effective.Ticks;
        }
    }
}
