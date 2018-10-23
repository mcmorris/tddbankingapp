namespace TddBankingApp
{
    public class Franc : Money
    {
        public Franc(decimal amount) :
            base(amount)
        {
            this.amount = amount;
        }
    }
}
