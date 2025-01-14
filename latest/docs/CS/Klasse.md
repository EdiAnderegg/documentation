# Struktur einer Klasse in C Sharp


```cs

    public class Rezept
    { 
        //Eigenschaften Klasse
        private string _string = ""; 
        private int _integer = 0;

        //Konstruktor Klasse
        public Rezept(string someString, int SomeInteger) 
        {
            String = someString;  
            Integer = someInteger;
        }

        //Equals-Methode zur Kontrolle von Duplikaten
        public bool Equals(Rezept other)
        {
            if (other == null)
            {
                return false;
            }
            else if (Name == other.Name && Zeit == other.Zeit)
            {
                return true;
            }
            return false;
        }

        //Getters and Setters
        public string String
        {
            get
            {
                return _string;
            }
            set
            {
                if (value == ""){ return;}
                _string = value;
            }
        }
        private int Integer
        {
            get
            {
                return _integer;
            }
            set
            {
                if (value >= 0)_integer = value;
            }
        }
	//Methoden
	.
	.
	.
       
    }

```