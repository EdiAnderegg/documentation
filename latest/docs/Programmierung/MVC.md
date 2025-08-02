# MVC


## Einfaches MVC-Beispiel

#### Bestehend aus:

- **Model:** Reine Objekte
- **View:** Forms (Windows Forms) 
- **Controller:** Speichert Daten in eine Liste

#### Ordneraufbau

📁 Controllers  
└── 📄 Control.cs
📁 Models  
└── 📄 ModelClass.cs
📁 Views  
└── 📄 View.cs
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
	//View
 
	```
=== "Controller"
	```cs
	//Controller
	``` 
