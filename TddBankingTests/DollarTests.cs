using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace TddBankingTests
{
    using TddBankingApp;

    [TestClass]
    public class DollarTests
    {
        [TestMethod]
        public void TestMultiplication()
        {
            var five = new Dollar(5);
            var product = five.times(2);
            five.times(2);
            Assert.AreEqual(10, product.amount);
            product = five.times(3);
            Assert.AreEqual(15, product.amount);
        }
    }
}
