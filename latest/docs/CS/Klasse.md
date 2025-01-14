# Struktur einer Klasse in C Sharp


```csharp

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
        public string Name
        {
            get
            {
                return _rezeptname;
            }
            set
            {
                if (value == ""){ return;}
                _rezeptname = value;
            }
        }
        private int Zeit
        {
            get
            {
                return _zeitaufwand;
            }
            set
            {
                if (value >= 0)_zeitaufwand = value;
            }
        }
        private string Zutaten
        {
            get
            {
                return _zutaten;
            }
            set
            {
                if (value == "") { return; };
                _zutaten = value;
            }
        }

	//Methoden
	.
	.
	.
       
    }

```