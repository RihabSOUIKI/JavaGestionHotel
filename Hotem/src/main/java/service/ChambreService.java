package service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Chambre;
import beans.User;
import connexion.Connexion;
import dao.IDao;

public class ChambreService implements IDao<Chambre> {

    @Override
    public boolean create(Chambre c) {
        String sql = "insert into Chambre values (null, ?, ?, ?, 'DDDD' )";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setInt(1, c.getNum());
            ps.setString(2, c.getType());
            ps.setDouble(3, c.getPrix());
            ps.setString(4, c.getPhoto());
            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("create : erreur sql : " + e.getMessage());

        }
        return false;
    }

    @Override
    public boolean delete(Chambre c) {
        String sql = "delete from Chambre where id  = ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setInt(1, c.getId());
            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("delete : erreur sql : " + e.getMessage());

        }
        return false;
    }

    @Override
    public boolean update(Chambre c) {

        String sql = "update Chambre set Num  = ? ,Type = ? , prix = ? , photo = ?  where id  = ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setInt(1, c.getNum());
            ps.setString(2, c.getType());
            ps.setDouble(3, c.getPrix());
            ps.setString(4, c.getPhoto());
            ps.setInt(5, c.getId());
            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("update : erreur sql : " + e.getMessage());

        }
        return false;
    }

    @Override
    public Chambre findById(int id) {
    	Chambre m = null;
        String sql = "select * from chambre where id  = ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
              return new Chambre(rs.getInt("id"), rs.getInt("num"), rs.getString("type"), rs.getDouble("prix"), rs.getString("photo"));
            }

        } catch (SQLException e) {
            System.out.println("findById " + e.getMessage());
        }
        return m;
    }

    @Override
    public List<Chambre> findAll() {
        List<Chambre> chambres = new ArrayList<Chambre>();

        String sql = "select * from Chambre";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
             chambres.add(new Chambre(rs.getInt("id"), rs.getInt("num"), rs.getString("type"), rs.getDouble("prix"), rs.getString("photo")));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return chambres;
    }
    
    
    
    
    
}


