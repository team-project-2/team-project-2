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
import model.ReportDepart;
import model.ReportPersonal;
import model.Users;

/**
 *
 * @author Administrator
 */
public class ReportDAO {

    public List<ReportPersonal> showReportPersonal(String txtid) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "select Staffs.Id, Staffs.Name, Departs.Name, "
                    + "sum(case when Records.Type = 1 then 1 else 0 end) as ThanhTich, "
                    + "sum(case when Records.Type = 0 then 1 else 0 end) as KyLuat, "
                    + "sum(case when Records.Type = 1 then 1 else 0 end) - sum(case when Records.Type = 0 then 1 else 0 end) as TongKet, "
                    + "rank() over (order by (sum(case when Records.Type = 1 then 1 else 0 end)  - sum(case when Records.Type = 0 then 1 else 0 end)) desc, sum(case when Records.Type = 0 then 1 else 0 end) asc) as rank "
                    + "from Staffs, Records, Departs where Staffs.Id = Records.StaffId and Staffs.DepartId = Departs.Id and Staffs.Id like +'%" + txtid + "%'"
                    + "Group by Staffs.Id, Staffs.Name, Departs.Name "
                    + "order by (sum(case when Records.Type = 1 then 1 else 0 end)  - sum(case when Records.Type = 0 then 1 else 0 end)) desc, sum(case when Records.Type = 0 then 1 else 0 end) asc ";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<ReportPersonal> list = new ArrayList<ReportPersonal>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String departid = rs.getString(3);
                int good = rs.getInt(4);
                int bad = rs.getInt(5);
                int total = rs.getInt(6);
                int rank = rs.getInt(7);
                ReportPersonal a = new ReportPersonal(id, name, departid, good, bad, total, rank);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<ReportDepart> showReportDepart(String txtid) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "select Staffs.DepartId, Departs.Name, "
                    + "sum(case when Records.Type = 1 then 1 else 0 end) as ThanhTich, "
                    + "sum(case when Records.Type = 0 then 1 else 0 end) as KyLuat, "
                    + "sum(case when Records.Type = 1 then 1 else 0 end) - sum(case when Records.Type = 0 then 1 else 0 end) as TongKet, "
                    + "rank() over (order by (sum(case when Records.Type = 1 then 1 else 0 end)  - sum(case when Records.Type = 0 then 1 else 0 end)) desc, sum(case when Records.Type = 0 then 1 else 0 end) asc) as rank "
                    + "from Staffs, Records, Departs where Staffs.Id = Records.StaffId and Staffs.DepartId = Departs.Id and Departs.Id like +'%" + txtid + "%'"
                    + "Group by  Staffs.DepartId, Departs.Name "
                    + "order by (sum(case when Records.Type = 1 then 1 else 0 end)  - sum(case when Records.Type = 0 then 1 else 0 end)) desc, sum(case when Records.Type = 0 then 1 else 0 end) asc ";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<ReportDepart> list = new ArrayList<ReportDepart>();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                int good = rs.getInt(3);
                int bad = rs.getInt(4);
                int total = rs.getInt(5);
                int rank = rs.getInt(6);
                ReportDepart a = new ReportDepart(id, name, good, bad, total, rank);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<ReportPersonal> showTop3Staff(String txtid) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "select TOP 3 Staffs.Id, Staffs.Name, Departs.Name, "
                    + "sum(case when Records.Type = 1 then 1 else 0 end) as ThanhTich, "
                    + "sum(case when Records.Type = 0 then 1 else 0 end) as KyLuat, "
                    + "sum(case when Records.Type = 1 then 1 else 0 end) - sum(case when Records.Type = 0 then 1 else 0 end) as TongKet, "
                    + "rank() over (order by (sum(case when Records.Type = 1 then 1 else 0 end)  - sum(case when Records.Type = 0 then 1 else 0 end)) desc, sum(case when Records.Type = 0 then 1 else 0 end) asc) as rank "
                    + "from Staffs, Records, Departs where Staffs.Id = Records.StaffId and Staffs.DepartId = Departs.Id and Staffs.Id like +'%" + txtid + "%'"
                    + "Group by Staffs.Id, Staffs.Name, Departs.Name "
                    + "order by (sum(case when Records.Type = 1 then 1 else 0 end)  - sum(case when Records.Type = 0 then 1 else 0 end)) desc, sum(case when Records.Type = 0 then 1 else 0 end) asc ";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<ReportPersonal> list = new ArrayList<ReportPersonal>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String departid = rs.getString(3);
                int good = rs.getInt(4);
                int bad = rs.getInt(5);
                int total = rs.getInt(6);
                int rank = rs.getInt(7);
                ReportPersonal a = new ReportPersonal(id, name, departid, good, bad, total, rank);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<ReportDepart> showTop3Depart(String txtid) {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "select TOP 3 Staffs.DepartId, Departs.Name, "
                    + "sum(case when Records.Type = 1 then 1 else 0 end) as ThanhTich, "
                    + "sum(case when Records.Type = 0 then 1 else 0 end) as KyLuat, "
                    + "sum(case when Records.Type = 1 then 1 else 0 end) - sum(case when Records.Type = 0 then 1 else 0 end) as TongKet, "
                    + "rank() over (order by (sum(case when Records.Type = 1 then 1 else 0 end)  - sum(case when Records.Type = 0 then 1 else 0 end)) desc, sum(case when Records.Type = 0 then 1 else 0 end) asc) as rank "
                    + "from Staffs, Records, Departs where Staffs.Id = Records.StaffId and Staffs.DepartId = Departs.Id and Departs.Id like +'%" + txtid + "%'"
                    + "Group by  Staffs.DepartId, Departs.Name "
                    + "order by (sum(case when Records.Type = 1 then 1 else 0 end)  - sum(case when Records.Type = 0 then 1 else 0 end)) desc, sum(case when Records.Type = 0 then 1 else 0 end) asc ";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<ReportDepart> list = new ArrayList<ReportDepart>();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                int good = rs.getInt(3);
                int bad = rs.getInt(4);
                int total = rs.getInt(5);
                int rank = rs.getInt(6);
                ReportDepart a = new ReportDepart(id, name, good, bad, total, rank);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

}
