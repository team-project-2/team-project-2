/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author Admin
 */
public class RandomString {

    public static String getRandomString(int loai, int dodai) {
        ////////Code ho tro lay chu ngau nhien, phat trien boi Congdongjava - Tran Huy
        //Loai : kieu ran dom
        //0 : ngau nhien chi cac chu cai thuong
        //1 : ngau nhien chi cac chu cai hoa
        //2 : ngau nhien ca chu hoa va thuong
        //3 : ngau nhien chu va so
        String ketqua = "";
        String hoa = "QWERTYUIOPASDFGHJKLZXCVBNM";
        String thuong = hoa.toLowerCase();
        String so = "1234567890";
        String randomchuoi = "";
        if (loai > 5 || loai < 0) {
            ketqua = "Loai khong hop le, cho phep tu 0 - 3";
        } else if (loai == 0) {
            randomchuoi = thuong;
        } else if (loai == 1) {
            randomchuoi = hoa;
        } else if (loai == 2) {
            randomchuoi = hoa + thuong;
        } else if (loai == 3) {
            randomchuoi = hoa + thuong + so;
        } else if (loai == 4) {
            randomchuoi = hoa + so;
        }
        for (int i = 0; i < dodai; i++) {
            int temp = (int) Math.round(Math.random() * randomchuoi.length());
            ketqua += randomchuoi.charAt(temp);
        }
        return ketqua;
    }
}
