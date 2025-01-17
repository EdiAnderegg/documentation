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