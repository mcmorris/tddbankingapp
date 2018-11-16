namespace TddBankingApp.Commands
{
    public interface IMoneyCommand<T>
    {
        T Do(IBank bank, T input);
        T Undo(T input);
    }
}
