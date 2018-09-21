/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import controller.ConnectionDB;
import model.Users;
import org.springframework.validation.BindingResult;

/**
 *
 * @author Admin
 */
public class UsersDAO {

    public UsersDAO() {

    }

    public List<Users> showUsers(String txtname) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Select * from Users where Username like +'%" + txtname + "%'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Users> list = new ArrayList<Users>();
            while (rs.next()) {
                String username = rs.getString(1);
                String password = rs.getString(2);
                String fullname = rs.getString(3);
                Users a = new Users(username, password, fullname);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean Insert(Users users) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Insert Users values(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, users.getUsername());
            ps.setString(2, users.getPassword());
            ps.setString(3, users.getFullname());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean Update(Users users) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Update Users set  Password = ?, Fullname = ? where Username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, users.getPassword());
            ps.setString(2, users.getFullname());
            ps.setString(3, users.getUsername());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean Delete(String username) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Delete from Users where Username like'" + username + "'";
            Statement st = conn.createStatement();
            int rs = st.executeUpdate(sql);
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean Login(String username, String password) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Select * from Users where Username like ? and Password like ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean UpdatePass(String username, String password) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Update Users set Password = ? where Username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean isExitEmail(String username) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Select * from Users where Username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public void getPassword(String password, String email) {
        try {
           Connection conn = ConnectionDB.getConn();
            String sql = "Update Users set Password = ? where Username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, email);
            int rs = ps.executeUpdate();

        } catch (Exception e) {
        }

    }
}
