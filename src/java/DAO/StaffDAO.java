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
import model.Staffs;
import model.Users;

import java.sql.Date;

/**
 *
 * @author Administrator
 */
public class StaffDAO {

    public StaffDAO() {

    }

    public List<Staffs> ShowStaff(String txtname) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Select * from Staffs where Name like +'%" + txtname + "%'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Staffs> list = new ArrayList<Staffs>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int gender = rs.getInt(3);
                Date birthday = rs.getDate(4);
                String photo = rs.getString(5);
                String email = rs.getString(6);
                String phone = rs.getString(7);
                float salary = rs.getFloat(8);
                String notes = rs.getString(9);
                String departId = rs.getString(10);
                Staffs a = new Staffs(id, name, gender, birthday, photo, email, phone, salary, notes, departId);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean Insert(Staffs staff) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Insert Staffs values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, staff.getName());
            ps.setInt(2, staff.getGender());
            ps.setDate(3, staff.getBirthday());
            ps.setString(4, staff.getPhoto());
            ps.setString(5, staff.getEmail());
            ps.setString(6, staff.getPhone());
            ps.setFloat(7, staff.getSalary());
            ps.setString(8, staff.getNotes());
            ps.setString(9, staff.getDepartid());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean Update(Staffs staff) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Update Staffs set  Name=?,Gender=?,Birthday=?,Photo=?,Email=?,Phone=?,Salary=?,Notes=?,DepartId=? where Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, staff.getName());
            ps.setInt(2, staff.getGender());
            ps.setDate(3, staff.getBirthday());
            ps.setString(4, staff.getPhoto());
            ps.setString(5, staff.getEmail());
            ps.setString(6, staff.getPhone());
            ps.setFloat(7, staff.getSalary());
            ps.setString(8, staff.getNotes());
            ps.setString(9, staff.getDepartid());
            ps.setInt(10, staff.getId());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    public boolean Update1(Staffs staff) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Update Staffs set  Name=?,Gender=?,Birthday=?,Email=?,Phone=?,Salary=?,Notes=?,DepartId=? where Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, staff.getName());
            ps.setInt(2, staff.getGender());
            ps.setDate(3, staff.getBirthday());
            ps.setString(4, staff.getEmail());
            ps.setString(5, staff.getPhone());
            ps.setFloat(6, staff.getSalary());
            ps.setString(7, staff.getNotes());
            ps.setString(8, staff.getDepartid());
            ps.setInt(9, staff.getId());
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
            String sql = "Delete from Staffs where Id like'" + id + "'";
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
