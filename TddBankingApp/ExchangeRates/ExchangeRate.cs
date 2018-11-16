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
            if (this.GetType() != other?.GetType()) { return false; }

            var otherRate = other as IExchangeRate;
            if (this.CurrencyFrom != otherRate?.CurrencyFrom || this.CurrencyTo != otherRate?.CurrencyTo) { return false; }
            return this.ConversionRate == otherRate?.ConversionRate && this.Effective.Ticks == otherRate.Effective.Ticks;
        }

        public override int GetHashCode()
        {
            unchecked
            {
                return (17 * this.CurrencyFrom.GetHashCode() * this.CurrencyTo.GetHashCode()) ^ this.ConversionRate.GetHashCode();
            }
        }
    }
}
