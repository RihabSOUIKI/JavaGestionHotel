package beans;


public class User {

    private int id;
    private String nom;
    private String prenom;
    private String email;
    private String password;
    private String etat;
    private String role;

    public User(int i, String n, String p, String e, String pa, String et, String r) {
        this.id = i;
        this.nom = n;
        this.prenom = p;
        this.email = e;
        this.password = pa;
        this.etat = et;
        this.role = r;
    }
    
    public User(String n, String p, String e, String pa, String et, String r) {
        this.nom = n;
        this.prenom = p;
        this.email = e;
        this.password = pa;
        this.etat = et;
        this.role = r;
    }
    

    public int getId() {
        return id;
    }


    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }
    
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return prenom +" " + nom;
    }

    

}
