package com.wwwxy.employeemanagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.wwwxy.employeemanagement.entity.EventEntity;
import com.wwwxy.employeemanagement.util.JDBCUtil;


public class SignMethodDao {
	//ǩ�˺�ͨ��empid�޸������¼
	public void UpdateEventByEmpid(int empid,int cid) {
		int a=0; //�ٵ�����
		int b=0; //���˴���
		int c=0; //�Ӱ����
		int d=0; //��������
		String status = "";
		EventDao ed = new EventDao();
		CheckDetailsDao cdd = new CheckDetailsDao();
		if(cid == 0){
			status = cdd.GetCheckStatus();
		}else{
			status = cdd.GetCheckStatusByCid(cid);
		}
		//System.out.println(status);
		String[] strs = status.split(",");
		for(String str:strs){
			if("�ٵ�".equals(str)){
				a++;
			}
			if("����".equals(str)){
				b++;
			}
			if("�Ӱ�".equals(str)){
				c++;
			}
			if("����".equals(str)){
				d++;
			}
			if(cid != 0 ){
				if("����".equals(str)){
					a--;
				}
			}
		}
		updateEventByEmpId(empid, a, b, c, d);
		//System.out.println("���������¼�ɹ�");
		float salary = new SalarySumDao().SalarySum(empid);
		new SalaryDao().UpdateSalaryByEmpId(empid, salary);
		//System.out.println("���¹��ʼ�¼�ɹ�");
	}
	
	//�޸Ŀ��ں�ͨ��empid ��������
	public int updateEventByEmpId(int empid,int a,int b,int c,int d){
		int eaward =0;
		int row = 0;
		PreparedStatement ps = null;
		Connection con = new JDBCUtil().getConnection();
		EventDao eDao = new EventDao();
		String sql = "Update event set eclocking = ?,eovertime = ?,ebigevent = ?,eaward = ? where empid = ?";
		try {
			ps = con.prepareStatement(sql);
			List<EventEntity> list = eDao.getEventById(empid);
			for(EventEntity lists:list){
				eaward = lists.geteAward();
				a = a+b+ lists.geteClocking();
				c = c+lists.geteOvertime();
				d = d+lists.geteBigevent();
			}
			ps.setInt(1, a);
			ps.setInt(2, c);
			ps.setInt(3, d);
			eaward = (c*50)-(a*50)-(d*100);  //���¹��ʽ���   ���� = �Ӱ�*50 - �ٵ�����*50-���� *100

			ps.setInt(4, eaward);
			ps.setInt(5,empid);
			row = ps.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally{
			try {
				ps.close();
				con.close();
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		float salary = new SalarySumDao().SalarySum(empid);
		new SalaryDao().UpdateSalaryByEmpId(empid, salary);
		return row;
	}
}
