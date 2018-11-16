namespace TddBankingApp
{
    public interface IMoney
    {
        decimal Amount { get; }

        ICurrency Currency { get; }
    }
}
