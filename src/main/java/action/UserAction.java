package action;
import PO.UserInfo;
import com.opensymphony.xwork2.ActionSupport;
import dao.HbnUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public class UserAction extends ActionSupport implements SessionAware {

    private Map<String,Object> session;

    private UserInfo userInfo;
    private Session hbnsession = HbnUtils.getSession();
    HttpServletRequest request = ServletActionContext.getRequest();

    public  String Login(){

       //System.out.println("用户名"+userInfo.getId());

        hbnsession.beginTransaction();
        String hql="select username from UserInfo   where id=?1 and password=?2 ";

        //唯一性查询
        String username=(String) hbnsession.createQuery(hql).
                setParameter(1,userInfo.getId()).
                setParameter(2,userInfo.getPassword())
                .uniqueResult();
        System.out.println("用户名"+username);
        hbnsession.getTransaction().commit();

        session.put("username",username);

        while(username != null){
            System.out.println("管理员--"+username+"--登录成功!");
            return "success";
        }
        return "error";

    }

    public String Register(){
        //Session session = HbnUtils.getSession();
        try {

            String id=request.getParameter("username");
            String username=id;
            String pwd=request.getParameter("password");
            System.out.println("注册信息"+id+username+pwd);

            UserInfo userInfo1 = new UserInfo(id,pwd,username);

            hbnsession.beginTransaction();

            hbnsession.save(userInfo1);
            hbnsession.getTransaction().commit();

            return "success";
        } catch (Exception e) {

            e.printStackTrace();
            hbnsession.getTransaction().rollback();
            return "error";
        }



    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public Map<String, Object> getSession() {
        return session;
    }


    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}
