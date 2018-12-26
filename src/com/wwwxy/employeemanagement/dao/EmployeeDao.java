package com.wwwxy.employeemanagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.wwwxy.employeemanagement.entity.EmployeeEntity;
import com.wwwxy.employeemanagement.entity.LoginEntity;
import com.wwwxy.employeemanagement.util.JDBCUtil;

public class EmployeeDao extends JDBCUtil{
	//��ʾ����Ա����Ϣ
	public List<EmployeeEntity> getAllEmployee(){
		List<EmployeeEntity> list = new ArrayList<EmployeeEntity>();
		Connection con = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from employee";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				EmployeeEntity ee = new EmployeeEntity();
				ee.setEmpId(rs.getInt("empid"));
				ee.setEmpName(rs.getString("empname"));
				ee.setEmpSex(rs.getString("empsex"));
				ee.setEmpAge(rs.getInt("empage"));
				ee.setEmpBirthday(rs.getString("empbirthday"));
				ee.setEmpBasic(rs.getFloat("empbasic"));
				ee.setEmpEmail(rs.getString("empemail"));
				ee.setEmpAddress(rs.getString("empaddress"));
				list.add(ee);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list ;
	}
	
	//����������ѯԱ����Ϣ��ģ����ѯ
	public List<EmployeeEntity> getEmployeeByName(String EmpName){
		List<EmployeeEntity> list = new ArrayList<EmployeeEntity>();
		Connection con = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from employee where empname like ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+EmpName+"%");
			rs = ps.executeQuery();
			while(rs.next()){
				EmployeeEntity ee = new EmployeeEntity();
				ee.setEmpId(rs.getInt("empid"));
				ee.setEmpName(rs.getString("empname"));
				ee.setEmpSex(rs.getString("empsex"));
				ee.setEmpAge(rs.getInt("empage"));
				ee.setEmpBirthday(rs.getString("empbirthday"));
				ee.setEmpBasic(rs.getFloat("empbasic"));
				ee.setEmpEmail(rs.getString("empemail"));
				ee.setEmpAddress(rs.getString("empaddress"));
				list.add(ee);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	//�޸�Ա����Ϣ
	public void UpdateEmployee(EmployeeEntity ee){
		Connection con = getConnection();
		PreparedStatement ps = null;
		String sql = "update employee set empname=?,empsex=?,empage=?,empbirthday=?,empbasic=?,empemail=?,empaddress=? where empid=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, ee.getEmpName());
			ps.setString(2, ee.getEmpSex());
			ps.setInt(3, ee.getEmpAge());
			ps.setString(4, ee.getEmpBirthday());
			ps.setFloat(5, ee.getEmpBasic());
			ps.setString(6, ee.getEmpEmail());
			ps.setString(7, ee.getEmpAddress());
			ps.setInt(8, ee.getEmpId());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public int UpdateEmployeeone(EmployeeEntity ee){
		int row =0;
		Connection con = getConnection();
		PreparedStatement ps = null;
		String sql = "update employee set empname=?,empsex=?,empage=?,empbirthday=?,empbasic=?,empemail=?,empaddress=? where empid=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, ee.getEmpName());
			ps.setString(2, ee.getEmpSex());
			ps.setInt(3, ee.getEmpAge());
			ps.setString(4, ee.getEmpBirthday());
			ps.setFloat(5, ee.getEmpBasic());
			ps.setString(6, ee.getEmpEmail());
			ps.setString(7, ee.getEmpAddress());
			ps.setInt(8, ee.getEmpId());
			row = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return row;
	}
	
	//���ݹ��Ų�ѯԱ��
	public EmployeeEntity getEmployeeById(int EmpId){
		EmployeeEntity ee = new EmployeeEntity();
		Connection con = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from employee where empid=?";
		try{
			ps = con.prepareStatement(sql);
			ps.setInt(1, EmpId);
			rs = ps.executeQuery();
			while(rs.next()){
				ee.setEmpId(rs.getInt("empid"));
				ee.setEmpName(rs.getString("empname"));
				ee.setEmpSex(rs.getString("empsex"));
				ee.setEmpAge(rs.getInt("empage"));
				ee.setEmpBirthday(rs.getString("empbirthday"));
				ee.setEmpBasic(rs.getFloat("empbasic"));
				ee.setEmpEmail(rs.getString("empemail"));
				ee.setEmpAddress(rs.getString("empaddress"));
			}
		}catch (Exception e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ee;
	}
	//����Ա��
	public int AddEmployee(EmployeeEntity ee){
		Connection con = getConnection();
		PreparedStatement ps = null;
		int row=0;
		String sql = "insert into employee (empname,empsex,empage,empbirthday,empbasic,empemail,empaddress) values(?,?,?,?,?,?,?)";
		try {
			ps= con.prepareStatement(sql);
			ps.setString(1, ee.getEmpName());
			ps.setString(2, ee.getEmpSex());
			ps.setInt(3, ee.getEmpAge());
			ps.setString(4, ee.getEmpBirthday());
			ps.setFloat(5, ee.getEmpBasic());
			ps.setString(6, ee.getEmpEmail());
			ps.setString(7, ee.getEmpAddress());
			row = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			new EventDao().AddEventAfterAddEmp(GetMaxId());
			EmployeeEntity ee1 =getEmployeeById(GetMaxId());
			String username =ee1.getEmpName();
			LoginEntity le = new LoginEntity(0, username, null, null, GetMaxId(), 0);
			new LoginDao().addLogin(le);
		}
		return row;
	}
	
	//��ѯԱ�����id
	public int GetMaxId() {
		EmployeeEntity ee = new EmployeeEntity();
		Connection con = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int empid = 0;
		String sql = "select max(empid) from employee";
		try{
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				empid = rs.getInt("max(empid)");
			}
		}catch (Exception e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return empid;
	}
	
	
	//ɾ��Ա����Ϣ
	public void DeleteEmployee(int EmpId){
		Connection con = getConnection();
		PreparedStatement ps = null;
		String sql = "delete from employee where empid=?";
		new EventDao().DropEventEntityByempid(EmpId);
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, EmpId);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		LoginEntity le = new LoginDao().getLoginById4(EmpId);
		int id = le.getId();
		new LoginDao().delLoginById3(id);
	}
	public int DeleteEmployeeone(int EmpId){
		int row=0;
		Connection con = getConnection();
		PreparedStatement ps = null;
		String sql = "delete from employee where empid=?";
		new EventDao().DropEventEntityByempid(EmpId);
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, EmpId);
			row=ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		LoginEntity le = new LoginDao().getLoginById4(EmpId);
		int id = le.getId();
		new LoginDao().delLoginById3(id);
		return row;
	}

}
