using System;
using System.Drawing.Printing;

namespace PrintPasswordPrompt
{
    class Program
    {
        static void Main(string[] args)
        {
            // Subscribe to the PrintDocument's PrintPage event
            PrintDocument printDoc = new PrintDocument();
            printDoc.PrintPage += PrintDoc_PrintPage;

            // Start listening for print jobs
            while (true)
            {
                printDoc.PrinterSettings.PrintFileName = "prompt";
                printDoc.Print();
            }
        }

        static void PrintDoc_PrintPage(object sender, PrintPageEventArgs e)
        {
            Console.Write("Enter the password to print: ");
            string password = Console.ReadLine();

            // Check the password and print the document if it's correct
            if (password == "mypassword")
            {
                e.HasMorePages = false; // Print only one page
                // Add your document printing code here
            }
            else
            {
                Console.WriteLine("Incorrect password. Print job canceled.");
                e.Cancel = true; // Cancel the print job
            }
        }
    }
}
