package bean;

import java.util.Date;

public class Post {
    String postid;
    String userid;
    String username;
    String subject;
    Date postdatetime;
    String posttitle;
    String postcontent;
    String look_num;

    public void setLook_num(String look_num) {
        this.look_num = look_num;
    }

    public String getLook_num() {
        return look_num;
    }

    public Date getPostdatetime() {
        return postdatetime;
    }

    public String getPostcontent() {
        return postcontent;
    }

    public String getPostid() {
        return postid;
    }

    public String getSubject() {
        return subject;
    }

    public String getPosttitle() {
        return posttitle;
    }

    public String getUserid() {
        return userid;
    }

    public String getUsername() {
        return username;
    }

    public void setPostcontent(String postcontent) {
        this.postcontent = postcontent;
    }

    public void setPostdatetime(Date postdatetime) {
        this.postdatetime = postdatetime;
    }

    public void setPostid(String postid) {
        this.postid = postid;
    }

    public void setPosttitle(String posttitle) {
        this.posttitle = posttitle;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
