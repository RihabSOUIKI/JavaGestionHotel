package service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.User;
import connexion.Connexion;
import dao.IDao;

public class UserService implements IDao<User> {

	@Override
	public boolean create(User o) {
		String sql = "insert into User values (null, ?, ?, ?, ? , ?, ?)";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, o.getNom());
			ps.setString(2, o.getPrenom());
			ps.setString(3, o.getEmail());
			ps.setString(4, o.getPassword());
			ps.setString(5, o.getEtat());
			ps.setString(6, o.getRole());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("create : erreur sql : " + e.getMessage());

		}
		return false;
	}

	@Override
	public boolean delete(User o) {
		String sql = "delete from User where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, o.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("delete : erreur sql : " + e.getMessage());

		}
		return false;
	}

	@Override
	public boolean update(User o) {

		String sql = "update User set nom  = ? ,prenom = ? , email = ? , password = ? , etat = ? , role = ? where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, o.getNom());
			ps.setString(2, o.getPrenom());
			ps.setString(3, o.getEmail());
			ps.setString(4, o.getPassword());
			ps.setString(5, o.getEtat());
			ps.setString(6, o.getRole());
			ps.setInt(7, o.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("update : erreur sql : " + e.getMessage());

		}
		return false;
	}

	@Override
	public User findById(int id) {
		User m = null;
		String sql = "select * from User where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return new User(rs.getInt("id"), rs.getString("nom"), rs.getString("prenom"), rs.getString("email"),
						rs.getString("password"), rs.getString("etat"), rs.getString("role"));
			}

		} catch (SQLException e) {
			System.out.println("findById " + e.getMessage());
		}
		return m;
	}

	@Override
	public List<User> findAll() {
		List<User> clients = new ArrayList<User>();

		String sql = "select * from User";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				clients.add(new User(rs.getInt("id"), rs.getString("nom"), rs.getString("prenom"),
						rs.getString("email"), rs.getString("password"), rs.getString("etat"), rs.getString("role")));
			}

		} catch (SQLException e) {
			System.out.println("findAll " + e.getMessage());
		}
		return clients;
	}

	public boolean checkAuth(String email, String pass) {
		try {
			String req = "select * from user where email = ? and password = ? and etat= 'Enable'";
			PreparedStatement pr = Connexion.getInstane().getConnection().prepareStatement(req);
			pr.setString(1, email);
			pr.setString(2, pass);
			ResultSet rs = pr.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public String findByEmail(String email) {
		String m = null;
		String sql = "select nom from User where email  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString("nom");
			}

		} catch (SQLException e) {
			System.out.println("findByEmail " + e.getMessage());
		}
		return m;
	}

	public boolean updateEtatEnable(User o) {
		String sql = "update User set etat = 'Enable' where id = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, o.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("update etat : erreur sql : " + e.getMessage());
		}
		return false;
	}

	public boolean updateEtatDisable(User o) {
		String sql = "update User set etat = 'Disable' where id = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, o.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("update etat : erreur sql : " + e.getMessage());
		}
		return false;
	}

}
