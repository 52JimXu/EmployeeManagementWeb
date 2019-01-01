package com.wwwxy.employeemanagement.dao;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

import com.sun.org.apache.xerces.internal.util.Status;
import com.wwwxy.employeemanagement.control.SignMethodControl;
import com.wwwxy.employeemanagement.entity.CheckDetails;
import com.wwwxy.employeemanagement.entity.CheckTimeEntity;
import com.wwwxy.employeemanagement.ui.SignMethodUi;
import com.wwwxy.employeemanagement.util.JDBCUtil;
public class CheckDetailsDao extends JDBCUtil{
	//��ѯ���п�����Ϣ
	public List<CheckDetails> getAllCheckDetails(){
		List<CheckDetails> list=new ArrayList<CheckDetails>();
		Connection con = this.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select * from checkdetails";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				CheckDetails cd=new CheckDetails();
				cd.setCid(rs.getInt("cid"));
				cd.setEmpid(rs.getInt("empid"));
				cd.setCcheckin(rs.getString("ccheckin"));
				cd.setCcheckout(rs.getString("ccheckout"));
				cd.setCstatus(rs.getString("cstatus"));
				cd.setCdate(rs.getString("cdate"));
				list.add(cd);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				this.close(con, ps, rs);
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return list;
}
	
	//ͨ��cid��ѯ��Ϣ
	
	public List<CheckDetails> getCheckDetails(int cid){
		List<CheckDetails> list=new ArrayList<CheckDetails>();
		Connection con = this.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select * from checkdetails where cid =?";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, cid);
			rs=ps.executeQuery();
			while(rs.next()){
				CheckDetails cd=new CheckDetails();
				cd.setCid(rs.getInt("cid"));
				cd.setEmpid(rs.getInt("empid"));
				cd.setCcheckin(rs.getString("ccheckin"));
				cd.setCcheckout(rs.getString("ccheckout"));
				cd.setCstatus(rs.getString("cstatus"));
				cd.setCdate(rs.getString("cdate"));
				list.add(cd);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				this.close(con, ps, rs);
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return list;
	}
	//����������Ϣ
	public int addCheckDetails(CheckDetails cd){
		int row=0;
		Connection con=this.getConnection();
		PreparedStatement ps=null;
		String sql="insert into checkdetails"
				+ "(cid,empid,ccheckin,ccheckout,cstatus,cdate) values(?,?,?,?,?,?)";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1,cd.getCid());
			ps.setInt(2,cd.getEmpid());
			ps.setString(3,cd.getCcheckin());
			ps.setString(4,cd.getCcheckout());
			ps.setString(5,cd.getCstatus());
			ps.setString(6,cd.getCdate());
			row=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				this.close(con, ps, null);
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return row;
	}
	//ɾ��������Ϣ
	public int delCheckDetailsBYCid(int cid){
		int row=0;
		Connection con=this.getConnection();
		PreparedStatement ps=null;
		String sql="delete from checkdetails where cid=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1,cid);
			row=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				this.close(con, ps, null);
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return row;
	}
	//����Ա��ID��ѯ��Ϣ
		public List<CheckDetails> getCheckDetailsByempid(int empid){
			List<CheckDetails> list = new ArrayList<CheckDetails>();
			Connection con = this.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			String sql = "select * from checkdetails where empid = ?";
			SignMethodUi smu=new SignMethodUi();
			
			try {
				ps = con.prepareStatement(sql);
				ps.setInt(1, empid);
				rs = ps.executeQuery();
				while(rs.next()){
					CheckDetails cd = new CheckDetails();
					cd.setCid(rs.getInt("cid"));
					cd.setEmpid(rs.getInt("empid"));
					cd.setCcheckin(rs.getString("ccheckin"));
					cd.setCcheckout(rs.getString("ccheckout"));
					cd.setCstatus(rs.getString("cstatus"));
					cd.setCdate(rs.getString("cdate"));
					list.add(cd);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					this.close(con, ps, rs);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return list;
		}
	//�޸Ŀ�����Ϣ
	public int updateCheckDetailsBYCid(CheckDetails cd){
		int row = 0;
		Connection con = this.getConnection();
		PreparedStatement ps = null;
		String sql = "update checkdetails set empid=?,ccheckin=?,"
				+ ",cstatus=?,cdate=? where cid=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, cd.getCid());
			ps.setInt(2, cd.getEmpid());
			ps.setString(3, cd.getCcheckin());
			ps.setString(4, cd.getCcheckout());
			ps.setString(5,cd.getCstatus());
			ps.setString(6, cd.getCdate());
			row=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				this.close(con, ps, null);
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return row;
	}
	//�޸Ŀ���״̬
	public int updatestatusBYCidone(CheckDetails cd){
		int row = 0;
		String Status="";
		int a=0,b=0,c=0,d=0;
		Connection con = this.getConnection();
		List<CheckDetails> list = getCheckDetails(cd.getCid());
		for(CheckDetails lists:list){
			Status = lists.getCstatus();
		}
		if(!Status.equals(cd.getCstatus()) ){
			if("�ٵ�".equals(Status)&&"����".equals(cd.getCstatus())){
				//�ٵ�������
				a--;
			}
			if("����".equals(Status)&&"����".equals(cd.getCstatus())){
				b--;
			}
			if("�ٵ�,����".equals(Status)&&"����".equals(cd.getCstatus())){
				b--;a--;
			}
			if("����".equals(Status)&&"����".equals(cd.getCstatus())){
				d--;
			}
			if("�Ӱ�".equals(Status)&&"����".equals(cd.getCstatus())){
				c--;
			}
			if("�ٵ�,�Ӱ�".equals(Status)&&"����".equals(cd.getCstatus())){
				c--;a--;
			}
			
			if("����".equals(Status)&&"�ٵ�".equals(cd.getCstatus())){
				a++;
			}
			if("����".equals(Status)&&"����".equals(cd.getCstatus())){
				b++;
			}
			if("����".equals(Status)&&"�ٵ�,����".equals(cd.getCstatus())){
				b++;a++;
			}
			if("����".equals(Status)&&"����".equals(cd.getCstatus())){
				d++;
			}
			if("����".equals(Status)&&"�Ӱ�".equals(cd.getCstatus())){
				c++;
			}
			if("����".equals(Status)&&"�ٵ�,�Ӱ�".equals(cd.getCstatus())){
				c++;a++;
			}
			
			if("�ٵ�".equals(Status)&&"�ٵ�,����".equals(cd.getCstatus())){
				b++;
			}
			if("�ٵ�".equals(Status)&&"����".equals(cd.getCstatus())){
				d++;a--;
			}
			if("�ٵ�".equals(Status)&&"�Ӱ�".equals(cd.getCstatus())){
				c++;a--;
			}
			if("�ٵ�".equals(Status)&&"�ٵ�,�Ӱ�".equals(cd.getCstatus())){
				c++;
			}
			
			if("����".equals(Status)&&"�ٵ�,����".equals(cd.getCstatus())){
				a++;
			}
			if("����".equals(Status)&&"����".equals(cd.getCstatus())){
				d--;d++;
			}
			if("����".equals(Status)&&"�Ӱ�".equals(cd.getCstatus())){
				b--;c++;
			}
			if("����".equals(Status)&&"�ٵ�,�Ӱ�".equals(cd.getCstatus())){
				c++;
			}
			
			if("�Ӱ�".equals(Status)&&"�ٵ�,����".equals(cd.getCstatus())){
				c--;a++;b++;
			}
			if("�Ӱ�".equals(Status)&&"����".equals(cd.getCstatus())){
				c--;d++;
			}
			if("�Ӱ�".equals(Status)&&"����".equals(cd.getCstatus())){
				c--;b++;
			}
			if("�Ӱ�".equals(Status)&&"�ٵ�".equals(cd.getCstatus())){
				c--;a++;
			}
			if("�Ӱ�".equals(Status)&&"�ٵ�,�Ӱ�".equals(cd.getCstatus())){
				a++;
			}
			
			if("����".equals(Status)&&"�ٵ�,����".equals(cd.getCstatus())){
				d--;a++;b++;
			}
			if("����".equals(Status)&&"�Ӱ�".equals(cd.getCstatus())){
				d--;c++;
			}
			if("����".equals(Status)&&"����".equals(cd.getCstatus())){
				d--;b++;
			}
			if("����".equals(Status)&&"�ٵ�".equals(cd.getCstatus())){
				d--;a++;
			}
			if("����".equals(Status)&&"�ٵ�,�Ӱ�".equals(cd.getCstatus())){
				d--;a++;c++;
			}
			
			if("�ٵ�,����".equals(Status)&&"����".equals(cd.getCstatus())){
				a--;b--;d++;
			}
			if("�ٵ�,����".equals(Status)&&"�Ӱ�".equals(cd.getCstatus())){
				a--;b--;c++;
			}
			if("�ٵ�,����".equals(Status)&&"����".equals(cd.getCstatus())){
				a--;
			}
			if("�ٵ�,����".equals(Status)&&"�ٵ�".equals(cd.getCstatus())){
				b--;
			}
			if("�ٵ�,����".equals(Status)&&"�ٵ�,�Ӱ�".equals(cd.getCstatus())){
				c++;b--;
			}
			
			if("�ٵ�,�Ӱ�".equals(Status)&&"����".equals(cd.getCstatus())){
				a--;c--;d++;
			}
			if("�ٵ�,�Ӱ�".equals(Status)&&"�Ӱ�".equals(cd.getCstatus())){
				a--;
			}
			if("�ٵ�,�Ӱ�".equals(Status)&&"����".equals(cd.getCstatus())){
				a--;c--;b++;
			}
			if("�ٵ�,�Ӱ�".equals(Status)&&"�ٵ�".equals(cd.getCstatus())){
				c--;
			}
			if("�ٵ�,�Ӱ�".equals(Status)&&"�ٵ�,����".equals(cd.getCstatus())){
				c--;b++;
			}
			
		}
		
		PreparedStatement ps = null;
		String sql = "update checkdetails set cstatus=? where cid=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,cd.getCstatus());
			ps.setInt(2, cd.getCid());
			row=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				this.close(con, ps, null);
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		int empid = new CheckDetailsDao().GetEmpidByCid(cd.getCid());
		SignMethodDao smd = new SignMethodDao();
		smd.updateEventByEmpId(empid, a, b, c, d);
		return row;
	}
	//ǩ��
	public int checkin(int empid) {
		int row = 0;
		Connection con = this.getConnection();
		PreparedStatement ps = null;
		String sql = "insert into checkdetails (empid,ccheckin,cstatus,cdate) values(?,?,?,?)";
		SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
		String nowtime = df.format(new Date());
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, empid);
			ps.setString(2, nowtime);
			ps.setString(3, "δǩ��");
			ps.setString(4, df1.format(new Date()));
			row = ps.executeUpdate();
		} catch (SQLException e) {
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
	
	//�鿴�Ƿ�ǩ����
	public int GetCheckin(int empid) {
		Connection con = this.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select empid from checkdetails where cstatus=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, "δǩ��");
			rs = ps.executeQuery();
			while(rs.next()){
				if(empid == rs.getInt("empid")){
					return 1;  //�Ѿ�ǩ������
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				new JDBCUtil().close(con, ps, rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;//δǩ��
		
	}
	//ͨ��empid�鿴δǩ�˵�ǩ��ʱ��
	public String GetCheckinTimeByEmpId(int empid) {
		Connection con = this.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String ccheckin = null;
		String sql = "select ccheckin from checkdetails where cstatus=? and empid=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, "δǩ��");
			ps.setInt(2, empid);
			rs = ps.executeQuery();
			if(rs.next()){
				ccheckin = rs.getString("ccheckin");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				new JDBCUtil().close(con, ps, rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
		return ccheckin;
	
	}
	
	
	//ǩ��
	public int checkout(int empid) {
		int row = 0;
		
		Connection con = this.getConnection();
		PreparedStatement ps = null;
		String sql = "update checkdetails set ccheckout =?,cstatus=? where empid = ? and cstatus=?";
		try {
			ps=con.prepareStatement(sql);
			SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
			String nowtime =df.format(new Date());
			String ccheckin = GetCheckinTimeByEmpId(empid);
			String flag = new SignMethodControl().CheckInThan(ccheckin, nowtime);
			
			ps.setString(1, nowtime);
			ps.setString(2, flag);

			ps.setInt(3, empid);
			ps.setString(4, "δǩ��");
			row = ps.executeUpdate();
		} catch (SQLException e) {
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
	//ͨ��empid��ѯ��һ��ǩ���Ŀ���״̬
	public String GetCheckStatus() {
		String status="";
		Connection con = this.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select cstatus from checkdetails where cid = (select max(cid) from checkdetails)";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				status = rs.getString("cstatus");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				new JDBCUtil().close(con, ps, rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return status;
		
	}
	
	// �޸�ʱͨ��cid��ȡ������Ϣ
	public String GetCheckStatusByCid(int cid) {
		String status="";
		Connection con = this.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select cstatus from checkdetails where cid = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, cid);
			rs = ps.executeQuery();
			if(rs.next()){
				status = rs.getString("cstatus");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				new JDBCUtil().close(con, ps, rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return status;
		
	}
	
	//��ȡĬ��ǩ��ʱ��
	public CheckTimeEntity GetCheckTime() {
		Connection con = this.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		CheckTimeEntity cte = new CheckTimeEntity();
		String sql = "select ccheckin,ccheckout from checktime where id=1";
		try {
			ps=con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				cte.setcCheckin(rs.getString("ccheckin"));
				cte.setcCheckout(rs.getString("ccheckout"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				new JDBCUtil().close(con, ps, rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cte;
	}
	
	//ͨ��cid�޸Ŀ���״̬
	public int UpdateStatusById(int cid,String flag) {
		int row = 0;
		Connection con = this.getConnection();
		PreparedStatement ps = null;
		String sql = "update checkdetails set cstatus=? where cid = ?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, flag);
			ps.setInt(2, cid);
			row = ps.executeUpdate();
		} catch (SQLException e) {
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
	//ͨ��cid��ȡempid
		public int GetEmpidByCid(int cid) {
			Connection con = this.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			int flag =0;
			String sql = "select empid from checkdetails where cid = ?";
			try {
				ps=con.prepareStatement(sql);
				ps.setInt(1, cid);
				rs = ps.executeQuery();
				if(rs.next()){
					flag = rs.getInt("empid");
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				try {
					new JDBCUtil().close(con, ps, null);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return flag;
		}
	
	
	
}