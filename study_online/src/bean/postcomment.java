package bean;
public class postcomment {
    String commentid;
    String postid;
    String userid;
    String username;
    String commentcontent;
    String commentdatetime;

    public String getCommentcontent() {
        return commentcontent;
    }

    public void setCommentcontent(String commentcontent) {
        this.commentcontent = commentcontent;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setPostid(String postid) {
        this.postid = postid;
    }

    public String getUsername() {
        return username;
    }

    public String getUserid() {
        return userid;
    }

    public String getPostid() {
        return postid;
    }

    public String getCommentid() {
        return commentid;
    }

    public void setCommentid(String commentid) {
        this.commentid = commentid;
    }

    public String getCommentdatetime() {
        return commentdatetime;
    }

    public void setCommentdatetime(String commentdatetime) {
        this.commentdatetime = commentdatetime;
    }
}
