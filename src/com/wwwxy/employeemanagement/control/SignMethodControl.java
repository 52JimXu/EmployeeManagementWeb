package com.wwwxy.employeemanagement.control;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.wwwxy.employeemanagement.dao.CheckDetailsDao;
import com.wwwxy.employeemanagement.entity.CheckTimeEntity;

public class SignMethodControl {
	public String CheckInThan(String checkin,String checkout) {
		String flag="";
		CheckDetailsDao cdd = new CheckDetailsDao();
		CheckTimeEntity cte = cdd.GetCheckTime();
		String ccheckin = cte.getcCheckin();
		String ccheckout = cte.getcCheckout();
		SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
		try {
			Date d1 = df.parse(ccheckin); //Ĭ��ǩ��ʱ��
			Date d2 = df.parse(ccheckout); //Ĭ��ǩ��ʱ��
			Date d3 = df.parse(checkin); //�û�ǩ��ʱ��
			Date d4 = df.parse(checkout); //�û�ǩ��ʱ��
			int t1 = (int) d1.getTime();//Ĭ��ǩ��ʱ��int����
			int t2 = (int) d2.getTime();//Ĭ��ǩ��ʱ��int����
			int t3 = (int) d3.getTime();//�û�ǩ��ʱ��int����
			int t4 = (int) d4.getTime();//�û�ǩ��ʱ��int����
			if(t3>t1){
				//�ٵ�
				flag = "�ٵ�";
			}
			if(t4<t2){
				//����
				flag = "����";
			}
			if(t3>t1 && t4<t2){
				flag = "�ٵ�,����";
			}
			if(t3>t1 && t4>(t2+360000)){
				flag = "�ٵ�,�Ӱ�";
			}
			if(t4>(t2+360000)){
				//�Ӱ�
				flag += ",�Ӱ�";
			}
			if(t1>=t3 && t4>=t2 && t4<(t2+360000)){
				flag = "����";
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return flag;
	}
}
