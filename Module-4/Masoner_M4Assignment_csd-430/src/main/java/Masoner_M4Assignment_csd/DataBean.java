package Masoner_M4Assignment_csd.430;

//Ean Masoner Module 4 Assignment CSD-430//
import java.io.Serializable;

public class DataBean implements Serializable {
    private static final long serialVersionUID = 1L;
    private String name;
    private int age;
    private String email;
    private String city;
    private String occupation;

    public DataBean() {}

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getOccupation() { return occupation; }
    public void setOccupation(String occupation) { this.occupation = occupation; }
}
