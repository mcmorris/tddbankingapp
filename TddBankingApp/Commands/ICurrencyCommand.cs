namespace TddBankingApp.Commands
{
    public interface ICurrencyCommand<T>
    {
        T Do(IBank bank, T input);
        T Undo(T input);
    }
}
