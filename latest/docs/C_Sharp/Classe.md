# Struktur einer Classe in C#


´´´c#

    public class Rezept
    { 
        //Eigenschaften Classe
        private string _rezeptname = "";
        private int _zeitaufwand = 0;
        private string _zutaten = "";

        //Konstruktor Classe
        public Rezept(string name, int zeit, string zutaten) 
        {
            Name = name;
            Zeit = zeit;
            Zutaten = zutaten;
        }

        //Equals Methode für Kontrolle von Duplikaten
        //Wichtig angewöhnen mit dem Equals Methode 
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

´´´