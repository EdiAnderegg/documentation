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

<div class="result" markdown>

=== "Model"

```cs

    public class ModelClass
    {
	
        private static int _counter;
        private string _string = ""; 
        private int _integer = 0;


        public ModelClass(string someString, int someInteger) 
        {
            Counter++;
            String = someString;  
            Integer = someInteger;
        }

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
       
    }

```

=== "View"


```cs

```

</div>