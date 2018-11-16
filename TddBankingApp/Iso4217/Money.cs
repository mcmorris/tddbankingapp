namespace TddBankingApp
{
    using System;

    using TddBankingApp.Iso4217;

    /// <summary>
    /// Represents a decimal amount of a specific <see cref="P:TddBankingApp.Money.Currency" />.
    /// </summary>
    [Serializable]
    public class Money : IMoney, IComparable<IMoney>
    {
        public decimal Amount { get; }

        public ICurrency Currency { get; }

        public Money(decimal amount, ICurrency currency)
        {
            this.Currency = currency;
            this.Amount = amount;
        }

        public override bool Equals(object other)
        {
            if (other is null) { return false; }
            if (other.GetType() != this.GetType()) { return false; }

            var otherMoney = other as IMoney;
            return this.Currency == otherMoney?.Currency && this.Amount == otherMoney?.Amount;
        }

        public override int GetHashCode()
        {
            unchecked
            {
                return (397 * this.Amount.GetHashCode()) ^ this.Currency.GetHashCode();
            }
        }

        public int CompareTo(IMoney other)
        {
            var unitCompare = this.Currency.CompareTo(other.Currency);
            return unitCompare == 0
                       ? Amount.CompareTo(other.Amount)
                       : unitCompare;
        }

        public override string ToString()
        {
            return this.Amount.FormatCurrency(this.Currency.AlphabeticCode);
        }

        public static bool operator ==(Money left, Money right)
        {
            return !(left is null) && left.Equals(right);
        }

        public static bool operator !=(Money left, Money right)
        {
            return !(left == right);
        }

        public static bool operator >(Money left, Money right)
        {
            return left.CompareTo(right) > 0;
        }

        public static bool operator <(Money left, Money right)
        {
            return left.CompareTo(right) < 0;
        }

        public static bool operator >=(Money left, Money right)
        {
            return left.CompareTo(right) >= 0;
        }

        public static bool operator <=(Money left, Money right)
        {
            return left.CompareTo(right) <= 0;
        }
    }
}
