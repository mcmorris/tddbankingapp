namespace TddBankingApp
{
    public class Currency : ICurrency
    {
        public decimal Amount { get; }
        public string Code { get; }

        public Currency(decimal amount, string code)
        {
            this.Amount = amount;
            this.Code = code;
        }

        public override bool Equals(object other)
        {
            if (this.GetType() != other?.GetType()) { return false; }

            var otherMoney = other as ICurrency;
            return this.Code == otherMoney?.Code && this.Amount == otherMoney?.Amount;
        }
    }
}
