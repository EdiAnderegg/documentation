
# Struktur einer SuperKlasse in C Sharp


```cs

    public class EineKalsse
    { 
        //Eigenschaften Klasse
	
        private static int _counter;
        private string _string = ""; 
        private int _integer = 0;

        //Konstruktor Klasse
        public Rezept(string someString, int SomeInteger) 
        {
            Counter++;
            String = someString;  
            Integer = someInteger;
        }

        //Equals-Methode zur Kontrolle von Duplikaten
        public bool Equals(EineKlasse other)
        {
            if (other == null)
            {
                return false;
            }
            else if (String == other.String && Integer == other.Integer)
            {
                return true;
            }
            return false;
        }

        //Getters and Setters

        //Counter Variable
	public static int Counter
        {
            get { return _counter; }
            private set { _counter=value; }
        }
        
        
        public string String
        {
            get { return _string; }
            set { if (value == ""){ return; } _string = value; }
        }

        public int Integer
        {
            get { return _integer; }
            set { if (value >= 0)_integer = value; }
        }


	//Methoden
	.
	.
	.
       
    }

```