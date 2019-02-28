package dbUesrBehavior;

import java.sql.*;
import java.util.ArrayList;

import org.apache.hadoop.hive.metastore.api.ThriftHiveMetastore.Processor.drop_database;

public class connDb {
	
	public static  String driveName="org.apache.hive.jdbc.HiveDriver";
    public static  String url="jdbc:hive2://localhost:10000/dblab";
    public static  String username="hadoop1";
    public static  String password="hadoop";
	
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
    
    //打开Hive数据库连接
    public static void startConn(){
        try{
            Class.forName(driveName);
            //连接数据库中间件
            try{
                con = DriverManager.getConnection(url, username, password);
            }catch(SQLException e){
                e.printStackTrace();
            }
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }
    }
 
    //关闭Hive数据库连接
    public static void endConn() throws SQLException{
        if(rs != null){
            rs.close();
            rs = null;
        }
        if(stmt != null){
            stmt.close();
            stmt = null;
        }
        if(con != null){
            con.close();
            con = null;
        }       
    }
    
    
 //查看前10位用户对商品的行为
    public static ArrayList findTopBehavior_type() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select uid,behavior_type from bigdata_user limit 10 ");
        while(rs.next()){
          //  String [] temp = {rs.getString("word"), rs.getString("num")};
              String [] temp = { rs.getString("uid"),rs.getString("behavior_type")};
             list.add(temp);
        }
        endConn();
        return list;
    }
    //查询前20位用户购买商品的时间
    public static ArrayList findTopTwenty() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select uid,visit_date  from bigdata_user where behavior_type=4  limit 20");
        while(rs.next()){
            String [] temp = {rs.getString("uid"),rs.getString("visit_date")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
  //查询前20位用户购买商品的种类
    public static ArrayList findTopTwentyItem_category() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select uid,item_category from bigdata_user limit 20");
        while(rs.next()){
            String [] temp = {rs.getString("uid"),rs.getString("item_category")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
    
  //查询uid不重复的数据有多少条
    public static ArrayList findTotal() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select count(distinct uid) as num from bigdata_user");
        while(rs.next()){
            String [] temp = {rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
    //查询购买商品的人数
    public static ArrayList findSpendTotal() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select count(*) as num from bigdata_user where behavior_type='4'");
        while(rs.next()){
            String [] temp = {rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
  //查询浏览商品的人数
    public static ArrayList findScanTotal() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select count(*) as num from bigdata_user where behavior_type='1'");
        while(rs.next()){
            String [] temp = {rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
  //查询收藏商品的人数
    public static ArrayList findSaveTotal() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select count(*) as num from bigdata_user where behavior_type='2'");
        while(rs.next()){
            String [] temp = {rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
  //查询2014年12月10日有多少人点击了淘宝店
    public static ArrayList findClickTotal() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select count(*) as num from bigdata_user where  visit_date='2014-12-10'");
        while(rs.next()){
            String [] temp = {rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    //查询2014年12月10日到13日有多少人购买了商品
    public static ArrayList findSpendItem() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select count(*) as num from bigdata_user where behavior_type='4' and visit_date<'2014-12-13' and visit_date>'2014-12-10'");
        while(rs.next()){
            String [] temp = {rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }

    
  //查询2014年12月10日到13日有多少浏览了商品
    public static ArrayList findScanItem() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select count(*) as num from bigdata_user where behavior_type='1' and visit_date<'2014-12-13' and visit_date>'2014-12-10'");
        while(rs.next()){
            String [] temp = {rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }

    //查询某月每天商品的购买数量
    public static ArrayList findMonthSpendTotal() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select count(distinct uid) as num , day(visit_date) as a from bigdata_user where behavior_type='4' group by day(visit_date) ");
        while(rs.next()){
            String [] temp = {rs.getString("a"),rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }

  //查询不同种类商品在某天的购买数量
    public static ArrayList findDaySpendTotal() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select item_category ,count(*) as num from bigdata_user where behavior_type='4' and  visit_date='2014-12-10'  group by  item_category ");
        while(rs.next()){
            String [] temp = {rs.getString("item_category"),rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }

  //查询不同种类商品在某天的浏览数量
    public static ArrayList findDayScanTotal() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select item_category ,count(*) as num from bigdata_user where behavior_type='1' and  visit_date='2014-12-10'  group by  item_category ");
        while(rs.next()){
            String [] temp = {rs.getString("item_category"),rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
    //查询某天购买商品数量在指定范围内的用户id
    public static ArrayList findItemId() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select uid from bigdata_user where behavior_type='4' and visit_date='2014-12-12' group by uid having count(behavior_type='4')>5");
        while(rs.next()){
            String [] temp = {rs.getString("uid")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
  //查询2014年买家购买商品的人数
    public static ArrayList findSpendYearNum() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select count(*) as num from bigdata_user where behavior_type='4' and visit_date<'2014-12-31' and visit_date>'2014-1-1'");
        while(rs.next()){
            String [] temp = {rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
  //查询不同类别商品的浏览次数
    public static ArrayList findItemScanNum() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select  item_category, count(*) as num from bigdata_user where behavior_type='1' group by  item_category");
        while(rs.next()){
            String [] temp = {rs.getString("item_category"), rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
  //查询不同类别商品的购买次数
    public static ArrayList findItemSpendNum() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select  item_category, count(*) as num from bigdata_user where behavior_type='4' group by  item_category");
        while(rs.next()){
            String [] temp = {rs.getString("item_category"), rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
  //查询各省份用户购买商品的数量
    public static ArrayList findProvinceSpendNum() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select province, count(*) as num from bigdata_user where behavior_type='4' group by  province");
        while(rs.next()){
            String [] temp = {rs.getString("province"), rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
  //查询各省份用户浏览商品的数量
    public static ArrayList findProvinceScanNum() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select province, count(*) as num from bigdata_user where behavior_type='1' group by  province");
        while(rs.next()){
            String [] temp = {rs.getString("province"), rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
    
  //查询某年购买商品总量前20名的用户
    public static ArrayList findYearTopTwenty() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select uid ,count(*) as total from bigdata_user where behavior_type='4' and visit_date<'2014-12-31' and visit_date>'2014-1-1'   group by uid order by total desc  limit 20 ");
        while(rs.next()){
            String [] temp = {rs.getString("uid"), rs.getString("total")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
  //查询某年购买商品总量前10名的省份
    public static ArrayList findProvinceTopTwenty() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select province, count(*) as total from bigdata_user where behavior_type='4' and visit_date<'2014-12-31' and visit_date>'2014-1-1'  group by  province order by total desc limit 10");
        while(rs.next()){
            String [] temp = {rs.getString("province"), rs.getString("total")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
  // 查询某年男买家购买商品的人数
    public static ArrayList findSpendMen() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select count(*) as num from bigdata_user where behavior_type='4' and visit_date<'2014-12-31' and visit_date>'2014-1-1'   and sex ='男'");
        while(rs.next()){
            String [] temp = {rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
 // 查询某年男买家购买商品的人数
    public static ArrayList findSpendWomen() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select count(*) as num from bigdata_user where behavior_type='4' and visit_date<'2014-12-31' and visit_date>'2014-1-1'   and sex ='女'");
        while(rs.next()){
            String [] temp = {rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
 // 分析消费者对商品的行为
    public static ArrayList analyBehavior_type() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select  behavior_type, count(*) as num from bigdata_user group by behavior_type ");
        while(rs.next()){
            String [] temp = {rs.getString("behavior_type"),rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
 //分析被购买商品总量前十的商品类型和被购买总量
    public static ArrayList analyItem_typeSpend() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select  item_category , count(*) as num from bigdata_user group by  item_category order by num desc limit 10  ");
        while(rs.next()){
            String [] temp = {rs.getString("item_category"),rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
 // 分析每年的哪个月份购买商品的量最多
    public static ArrayList analyMonthTotal() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select month(visit_date) as month ,count(*)  as num  from bigdata_user where behavior_type = '4' group by month(visit_date) ");
        while(rs.next()){
            String [] temp = {rs.getString("month"),rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
 // 购买排名前十的不同种类商品在某天的购买比例分析
    public static ArrayList analyKindItemBuy() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select  item_category,count(*) as num from bigdata_user where visit_date='2014-12-11'and behavior_type='4' group by  item_category order by num desc limit 10 ");
        while(rs.next()){
            String [] temp = {rs.getString("item_category"),rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
 // 浏览排名前十的不同种类商品在某天的浏览比例分析
    public static ArrayList analyKindItemTopScan() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select  item_category,count(*) as num from bigdata_user where visit_date='2014-12-18'and behavior_type='1' group by  item_category  order by num desc limit 10 ");
        while(rs.next()){
            String [] temp = {rs.getString("item_category"),rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
    // 某个用户在某年购买、浏览和收藏商品的比例分析
    public static ArrayList analyYearBehavior_type() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select  behavior_type, count(*)  as num from bigdata_user where visit_date<'2014-12-31' and visit_date>'2014-1-1'   and  uid= '100029775'  group by behavior_type  ");
        while(rs.next()){
            String [] temp = {rs.getString("behavior_type"),rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
    
    // 分析购买排名前十的不同类别商品的购买次数比例
    public static ArrayList analyTopBehavior_typeBuy() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select  item_category,count(*) as num from bigdata_user where behavior_type='4' group by  item_category  order by num desc limit 10 ");
        while(rs.next()){
            String [] temp = {rs.getString("item_category"),rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
    //各省份购买商品的比例分析
    public static ArrayList analyProvinceBuy() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select province, count(*) as num from bigdata_user where behavior_type='4' group by  province");
        while(rs.next()){
            String[] temp={rs.getString("province"),rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
    //各省份浏览商品的比例分析
    public static ArrayList analyProvinceScan() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select province, count(*) as num from bigdata_user where behavior_type='4' group by  province");
        while(rs.next()){
            String[] temp={rs.getString("province"),rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
    
    // 男女买家购买商品的比例分析
    public static ArrayList analySexBuy() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select province, count(*) as num from bigdata_user where behavior_type='1' group by  province");
        while(rs.next()){
            String [] temp = {rs.getString("province"),rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
 // 男女买家购买商品的比例分析
    public static ArrayList analySexScan() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select sex, count(*) as num from bigdata_user where behavior_type='1'    group by  sex ");
        while(rs.next()){
            String [] temp = {rs.getString("sex"),rs.getString("num")};
            list.add(temp);
        }
        endConn();
        return list;
    }
    
    
}

