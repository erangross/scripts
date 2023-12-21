using System;
using System.Windows.Forms;

public class Program
{
    [STAThread]
    static void Main()
    {
        Application.EnableVisualStyles();
        Application.SetCompatibleTextRenderingDefault(false);
        Application.Run(new MainForm());
    }
}

public class MainForm : Form
{
    private Button button1;
    private TextBox textBox1;
    private TextBox textBox2;

    public MainForm()
    {
        button1 = new Button();
        textBox1 = new TextBox();
        textBox2 = new TextBox();

        button1.Text = "Compress File";
        button1.Location = new System.Drawing.Point(30, 150);
        button1.Click += new EventHandler(button1_Click);

        textBox1.Location = new System.Drawing.Point(30, 30);
        textBox2.Location = new System.Drawing.Point(30, 90);

        Controls.Add(button1);
        Controls.Add(textBox1);
        Controls.Add(textBox2);
    }

   private void button1_Click(object sender, EventArgs e)
{
    string sourceFile = textBox1.Text; // Get the source file path from textBox1
    string destinationFile = textBox2.Text; // Get the destination file path from textBox2

    using (FileStream originalFileStream = new FileStream(sourceFile, FileMode.Open, FileAccess.Read))
    {
        using (FileStream compressedFileStream = File.Create(destinationFile))
        {
            using (GZipStream compressionStream = new GZipStream(compressedFileStream, CompressionMode.Compress))
            {
                originalFileStream.CopyTo(compressionStream);
            }
        }
    }

    MessageBox.Show("File compressed successfully!");
}
}