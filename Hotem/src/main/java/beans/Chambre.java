package beans;


public class Chambre {

    private int id;
    private int num;
    private String type;
    private double prix;
    private String photo;


    public Chambre(int i, int n, String t, double p, String ph) {
        this.id = i;
        this.num = n;
        this.type = t;
        this.prix = p;
        this.photo = ph;
        
    }
    
    public Chambre( int n, String t, double p, String ph) {
        
        this.num = n;
        this.type = t;
        this.prix = p;
        this.photo = ph;
        
    }
    

    public int getId() {
        return id;
    }


    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }
    
    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
    
   
    @Override
    public String toString() {
        return num +" " + type;
    }

    

}
