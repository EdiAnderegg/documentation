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
	


	using Meldung = MVC.Utils.Meldung;

	namespace MVC.Models
	{
	    public class ModelClass
	    {
	        private static int _counter;
	        private string _someString;
	        private int _someInteger;

	        public ModelClass(string someString, int someInteger)
	        {
	            String = someString;
	            Integer = someInteger;
	            Counter++;
	        }

	        public static int Counter
	        {
	            get => _counter;
	            private set => _counter = value;
	        }

	        public string String 
	        {
	            get => _someString;
	            set 
	            {
	                if (_someString == null)
	                {
	                    Meldung.ZeigeMessage(" someString kann nicht leer sein", "Warning");
	                    Counter--;
	                    return;
	                }
	                 _someString = value;
	            }
	        }
	        public int Integer
	        {
	            get => _someInteger;
	            set 
	            {
	                if(value <= 0) 
	                {
	                    Meldung.ZeigeMessage(" someInteger kann nicht 0 oder -n sein", "Warning");
	                    Counter--;
	                    return;
	                }
	                _someInteger = value;
	            }
	        }

	        public bool Equals(ModelClass other)
	        {
	            if (other == null)
	            {
	                return false;
	            }
	            else if (String == other.String && Integer == other.Integer)
	            {
	                Counter--;
	                return true;
	            }
	            return false;
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
	            BaueObjektVonInput(SomeString.Text, (int)SomeInteger.Value);
	            AnzahlObjekte.Text = ZeigeAnzahlGespeicherteObjekte();
	            ClearInputs(ref SomeString, ref SomeInteger);
	        }

	        private void BaueObjektVonInput(string inputString, int inputInteger)
	        {
	            bool objekt = Control.Add(inputString, inputInteger);
	            if (objekt)
	            {
	                Meldung.ZeigeMessage("Es gibt ein Objekt mit den gleichen Werten", "Warning");
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

	namespace MVC.Controllers
	{
	    public static class Control
	    {
	        //Speicher Objekten
	        private static readonly List<ModelClass> Speicher = new List<ModelClass>();

	        // Neues Objekt anlegen
	        public static bool Add(string someString, int someInteger)
	        {
	            Console.WriteLine(Speicher.Count);
	            var objekt = new ModelClass(someString, someInteger);

	            if (EinDuplikat(objekt)) return true;
            
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
