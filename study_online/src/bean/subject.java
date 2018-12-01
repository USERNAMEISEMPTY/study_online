package bean;

public class subject {
    String subjectname;
    String url;

    public String getUrl() {
        url=""+subjectname+"";
        return url;
    }

    public String getSubjectname() {
        return subjectname;
    }

    public void setSubjectname(String subjectname) {
        this.subjectname = subjectname;
    }
}
