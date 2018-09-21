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
import model.Departs;

/**
 *
 * @author Admin
 */
public class DepartDAO {

    public DepartDAO() {

    }

    public List<Departs> ShowDeparts(String txtname) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Select * from Departs where Name like +'%" + txtname + "%'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Departs> list = new ArrayList<Departs>();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                Departs a = new Departs(id, name);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean Insert(Departs depart) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Insert Departs values(?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, depart.getId());
            ps.setString(2, depart.getName());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean Update(Departs depart) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Update Departs set  Name = ? where Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, depart.getName());
            ps.setString(2, depart.getId());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean Delete(String id) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Delete from Departs where Id like'" + id + "'";
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
   

}
