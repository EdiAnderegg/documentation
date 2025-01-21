---
title: MVC Strukturen
---


# MVC Strukturen


**Die MVC-Strukturen Möglichkeiten**  
*gotta catch em all*


##Einfaches MVC (Windows Forms)

- **Model:** Reine Objekte
- **View:** Forms (Windows Forms)
- **Controller:** Speichert Daten in eine Liste

=== "Model"
	```cs
	//Model
	```
=== "View"
	```cs
	using System;
	using System.Windows.Forms;
	using Control = MVC.Controllers.Control;

	namespace MVC.Views
	{
	    public partial class View : Form
	    {
	        public View()
	        {
	            InitializeComponent();
	        }

	        private void ObjekteErstellenUndSpeichern_Click(object sender, EventArgs e)
	        {
	            BaueObjektVonInput(SomeString.Text, (int)SomeInteger.Value);
	            AnzahlObjekte.Text = ZeigeAnzahlGespeicherteObjekte();
	            ClearInputs(ref SomeString, ref SomeInteger);
	        }

	        private void BaueObjektVonInput(string inputString, int inputInteger)
	        {
	            bool objekt = Control.Add(inputString, inputInteger);
	            if (objekt)
	            {
	                Meldung("Es gibt ein Objekt mit den gleichen Werten", "Warning");
	            }

	        }

	        private string ZeigeAnzahlGespeicherteObjekte()
	        {
	            return Control.GespeicherteObjekte().ToString();
	        }

	        private void ClearInputs(ref TextBox text, ref NumericUpDown zahl)
	        {
	            text.Text = string.Empty;
	            zahl.Value = 0;
	        }

	        private static void Meldung(string message, string caption)
	        {
	             MessageBox.Show(
	                 message,
	                 caption,
	                 MessageBoxButtons.OK,
	                 MessageBoxIcon.Warning
	                 );
	        }
	    }
	}
 
	```
=== "Controller"
	```cs
	//Controller
	``` 
