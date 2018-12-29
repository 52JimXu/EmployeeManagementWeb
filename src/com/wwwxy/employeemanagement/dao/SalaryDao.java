package com.wwwxy.employeemanagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


import com.wwwxy.employeemanagement.entity.SalaryEntity;
import com.wwwxy.employeemanagement.util.JDBCUtil;

public class SalaryDao {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	//��ѯ����
	public List GetAllSalary() {
		JDBCUtil jdbc = new JDBCUtil();
		con = jdbc.getConnection();
		try {
			ps = con.prepareStatement("select * from salary");
			rs = ps.executeQuery();
			List list = new ArrayList();
			while(rs.next()){
				SalaryEntity se = new SalaryEntity();
				se.seteId(rs.getInt("eid"));
				se.setEmpId(rs.getInt("empid"));
				se.setsId(rs.getInt("sid"));
				se.setsSum(rs.getInt("ssum"));
				se.setsTime(rs.getString("stime"));
				list.add(se);
			}
			return list;
		} catch (SQLException e) {
			System.out.println("sql����");
			return null;
		}finally{
			try {
				jdbc.close(con, ps, rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	//����
	public int add(SalaryEntity se){
		String sql = "insert into salary(eid,empid,ssum,stime)"
				+ " values(?,?,?,?)";
		int row = 0;
		SalarySumDao ssd = new SalarySumDao();
		float salary = ssd.SalarySum(se.getEmpId());
		try{
			con = new JDBCUtil().getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1,se.geteId());
			ps.setInt(2,se.getEmpId());
			ps.setFloat(3,salary);
			ps.setString(4,se.getsTime().toString());
			
			row = ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try {
				new JDBCUtil().close(con, ps, null);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	//ɾ��
	public int delete(int id){
		String sql = "delete from salary where sid = "+id;
		Connection con = null;
		PreparedStatement ps = null;
		int row = 0;
		try{
			con = new JDBCUtil().getConnection();
			ps = con.prepareStatement(sql);
			row = ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				new JDBCUtil().close(con, ps, null);
			} catch (SQLException e) {
				e.printStackTrace();
			};
		}
		return row;
		
	}
	
	//ͨ��empidɾ���ʼ�¼
		public void deleteByempid(int id){
			String sql = "delete from salary where empid = "+id;
			Connection con = null;
			PreparedStatement ps = null;
			try{
				con = new JDBCUtil().getConnection();
				ps = con.prepareStatement(sql);
				
				ps.executeUpdate();
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				try {
					new JDBCUtil().close(con, ps, null);
				} catch (SQLException e) {
					e.printStackTrace();
				};
			}
		}
	//����by eID
	public int update (SalaryEntity se){
		String sql = "update salary set eid=?,"
				+ "empid=?,ssum=?,stime=? where sid =?";
		Connection con = null;
		PreparedStatement ps = null;
		int row=0;
		try{
			con = new JDBCUtil().getConnection();
			ps = con.prepareStatement(sql);
			
			
			ps.setInt(1,se.geteId());
			ps.setInt(2,se.getEmpId());
			ps.setFloat(3,se.getsSum());
			ps.setString(4,se.getsTime());
			ps.setInt(5, se.getsId());
			
			row = ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				new JDBCUtil().close(con, ps, null);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	//����id������
		public int updatedateone(int sid , String sTime){
			String sql = "update salary set stime=? where sid =?";
			Connection con = null;
			PreparedStatement ps = null;
			int row=0;
			try{
				con = new JDBCUtil().getConnection();
				ps = con.prepareStatement(sql);
				
				ps.setString(1,sTime);
				ps.setInt(2,sid);
				
				row = ps.executeUpdate();
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				try {
					new JDBCUtil().close(con, ps, null);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return row;
		}
	//ͨ��Ա��id���¹����ܺ�
	public int UpdateSalaryByEmpId(int empid,float ssum) {
		String sql = "update salary set ssum=? where empid =?";
		Connection con = null;
		PreparedStatement ps = null;
		int row=0;
		try{
			con = new JDBCUtil().getConnection();
			ps = con.prepareStatement(sql);
			
			
			ps.setFloat(1,ssum);
			ps.setInt(2,empid);
			
			row = ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				new JDBCUtil().close(con, ps, null);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	
	}
	
	//��ѯby sid
	public List<SalaryEntity> GetSalaryById(int id) {
		JDBCUtil jdbc = new JDBCUtil();
		con = jdbc.getConnection();
		try {
			ps = con.prepareStatement("select * from salary where sid=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			List<SalaryEntity> list = new ArrayList<SalaryEntity>();
			while(rs.next()){
				SalaryEntity se = new SalaryEntity();
				se.seteId(rs.getInt("eid"));
				se.setEmpId(rs.getInt("empid"));
				se.setsId(rs.getInt("sid"));
				se.setsSum(rs.getInt("ssum"));
				se.setsTime(rs.getString("stime"));
				list.add(se);
			}
			return list;
		} catch (SQLException e) {
			System.out.println("sql����");
			return null;
		}finally{
			try {
				jdbc.close(con, ps, rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//��ѯby empid
		public List<SalaryEntity> GetSalaryByEmpId(int id) {
			JDBCUtil jdbc = new JDBCUtil();
			con = jdbc.getConnection();
			try {
				ps = con.prepareStatement("select * from salary where empid=?");
				ps.setInt(1, id);
				rs = ps.executeQuery();
				List<SalaryEntity> list = new ArrayList<SalaryEntity>();
				while(rs.next()){
					SalaryEntity se = new SalaryEntity();
					se.seteId(rs.getInt("eid"));
					se.setEmpId(rs.getInt("empid"));
					se.setsId(rs.getInt("sid"));
					se.setsSum(rs.getInt("ssum"));
					se.setsTime(rs.getString("stime"));
					list.add(se);
				}
				return list;
			} catch (SQLException e) {
				System.out.println("sql����");
				return null;
			}finally{
				try {
					jdbc.close(con, ps, rs);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		//����һ������֮������һ�����ʼ�¼
		public void AddSalaryAfterAddEvent(int empid) {
			String sql = "insert into salary(eid,empid,ssum,stime)"
					+ " values((select max(eid) from event),?,?,?)";
			try{
				con = new JDBCUtil().getConnection();
				ps = con.prepareStatement(sql);
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.DATE, 30);
				Date date = cal.getTime();
				String nextdate = df.format(date);
				ps.setInt(1,empid);
				float salary = new SalarySumDao().SalarySum(empid);
				ps.setFloat(2,salary);
				ps.setString(3,nextdate);
				ps.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}
			finally{
				try {
					new JDBCUtil().close(con, ps, null);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
}
