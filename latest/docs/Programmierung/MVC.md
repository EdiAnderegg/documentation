# MVC


## Einfaches MVC-Beispiel

#### Bestehend aus:

- **Model:** Reine Objekte
- **View:** Forms (Windows Forms) 
- **Controller:** Speichert Daten in eine Liste

#### Ordneraufbau

📁 Controllers  
└── 📄 Control.cs </br>
📁 Models  
└── 📄 ModelClass.cs </br>
📁 Views  
└── 📄 View.cs </br>
📁 Utils  
└── 📄 message.cs

=== "Model"
	```cs 
	// ==================
	// ModelClass.cs
	// ==================
	



	using System;

	namespace MVC.Models
	{
	    public class ModelClass
	    {
	        private static int _counter;

	        public string String { get; }
	        public int Integer { get; }
	        public static int Counter => _counter;

	        public ModelClass(string someString, int someInteger)
	        {
	            if (string.IsNullOrWhiteSpace(someString)) 
	            {
	                throw new ArgumentException("someString darf nicht leer sien.");
	            }

	            if (someInteger <= 0)
	            {
	                throw new ArgumentException("someInteger muss > 0 sien.");
	            }
	            String = someString;
	            Integer = someInteger;
	            _counter++;
	        }


	        public bool Equals(ModelClass other)
	        {
	            return other != null && 
	                   String == other.String &&
	                   Integer == other.Integer;
	        } 
	    }
	}


	```
=== "View" 
	```cs
	// ==================
	// View.cs
	// ==================



	using System;
	using System.Windows.Forms;
	using Control = MVC.Controllers.Control;
	using Meldung = MVC.Utils.Meldung;

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
	            // Baue und speichere Objekt
	            var erfolgreich = BaueObjektVonInput(SomeString.Text, (int)SomeInteger.Value);

	            // Nur bei Erfolg die Anzeige aktualisieren und Eingaben löschen
	            if (!erfolgreich)
	            {
	                AnzahlObjekte.Text = ZeigeAnzahlGespeicherteObjekte();
	                ClearInputs(ref SomeString, ref SomeInteger);
	            }


	        }

	        private bool BaueObjektVonInput(string inputString, int inputInteger)
	        {
	            return Control.Add(inputString, inputInteger);
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
	    }
	}


 
	```
=== "Controller"
	```cs
	// ===================
	// Control.cs
	// ===================



	using MVC.Models;
	using System;
	using System.Collections.Generic;
	using Meldung = MVC.Utils.Meldung;

	namespace MVC.Controllers
	{
	    public static class Control
	    {
	        //Speicher Objekten
	        private static readonly List<ModelClass> Speicher = new List<ModelClass>();

	        // Neues Objekt anlegen
	        public static bool Add(string someString, int someInteger)
	        {

	            // Validierung vor Object erstellung
	            if (string.IsNullOrWhiteSpace(someString)) 
	            {
	                Meldung.ZeigeMessage("someString kann nicht leer sein", "Warning");
	                return true;
	            }

	            if(someInteger <= 0)
	            {
	                Meldung.ZeigeMessage("someInteger kann nicht 0 oder negativ sein", "Warning");
	                return true;
	            }

	            var objekt = new ModelClass(someString, someInteger);

	            if (EinDuplikat(objekt))
	            {
	                Meldung.ZeigeMessage("Es gibt ein Objekt mit den gleichen Werten", "Warning");
	                return true;
	            }

	            Speicher.Add(objekt);
	            return false;
	        }

	        // Anzahl erstellte Objekte
	        public static int GespeicherteObjekte()
	        {
	            return ModelClass.Counter;
	        }

	        //Equals Kontrolle
	        private static bool EinDuplikat(ModelClass ErstellterObjekt) 
	        {
	            foreach (var Objekt in Speicher)
	            {
	               if(Objekt.Equals(ErstellterObjekt)) return true;
	            }
	            return false;
	        }
	    }
	}


	``` 
=== "Utils"
	```cs
	// =================
	// message.cs
	// =================



	using System.Windows.Forms;

	namespace MVC.Utils
	{
	    public static class Meldung
	    {
 
	        public static void ZeigeMessage(string message, string caption)
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
