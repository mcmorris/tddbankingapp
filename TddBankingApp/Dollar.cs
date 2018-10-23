namespace TddBankingApp
{
    public class Dollar
    {
        private decimal _amount;

        public Dollar(decimal amount)
        {
            this._amount = amount;
        }

        public Dollar Times(int multiplier)
        {
            return new Dollar(this._amount * multiplier);
        }

        public override bool Equals(object other)
        {
            var otherDollar = (Dollar)other;
            return this._amount == otherDollar?._amount;
        }
    }
}
