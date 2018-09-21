/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import controller.ConnectionDB;
import model.Records;
import model.Staffs;

/**
 *
 * @author Administrator
 */
public class RecordDAO {

    public List<Records> showRecord(String txtid) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Select * from Records where Id like +'%" + txtid + "%'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Records> list = new ArrayList<Records>();
            while (rs.next()) {
                int id = rs.getInt(1);
                int type = rs.getInt(2);
                String reason = rs.getString(3);
                Date date = rs.getDate(4);
                int staffid = rs.getInt(5);
                Records a = new Records(id, type, reason, date, staffid);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean Insert(Records record) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Insert Records values(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, record.getType());
            ps.setString(2, record.getReason());
            ps.setDate(3, record.getDate());
            ps.setInt(4, record.getStaffid());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean Update(Records record) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Update Records set  Type = ?, Reason = ?, Date = ?, StaffId = ? where Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, record.getType());
            ps.setString(2, record.getReason());
            ps.setDate(3, record.getDate());
            ps.setInt(4, record.getStaffid());
            ps.setInt(5, record.getId());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean Delete(String txtid) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Delete from Records where Id like'" + txtid + "'";
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
