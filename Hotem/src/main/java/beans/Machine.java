package beans;


public class Machine {

    private int id;
    private String username;
    private String telephone;
    private String typeC;
    private String datedebut;
    private String datefin;
    private String etat;
    

    public Machine(int i, String u, String t, String ty, String dd, String df, String e) {
        this.id = i;
        this.username = u;
        this.telephone = t;
        this.typeC = ty;
        this.datefin = df;
        this.etat = e;
        this.datedebut = dd;
    }
    
    public Machine(String u, String t, String ty, String dd, String df, String e) {
       
        this.username = u;
        this.telephone = t;
        this.typeC = ty;
        this.datefin = df;
        this.etat = e;
        this.datedebut = dd;
    }
    

    public int getId() {
        return id;
    }


    
    
    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getTypeC() {
		return typeC;
	}

	public void setTypeC(String typeC) {
		this.typeC = typeC;
	}

	public String getDatedebut() {
		return datedebut;
	}

	public void setDatedebut(String datedebut) {
		this.datedebut = datedebut;
	}

	public String getDatefin() {
		return datefin;
	}

	public void setDatefin(String datefin) {
		this.datefin = datefin;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }
    

    @Override
    public String toString() {
        return username +" : " + typeC;
    }

    

}

