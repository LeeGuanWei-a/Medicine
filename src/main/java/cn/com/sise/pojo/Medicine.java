package cn.com.sise.pojo;

public class Medicine {


    private int id;
    private String name;
    private float price;
    private String press;
    private String YB;      //药品国标
    private String pic;

    public Medicine() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getYB() {
        return YB;
    }

    public void setYB(String YB) {
        this.YB = YB;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    @Override
    public String toString() {
        return "Medicine{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", press='" + press + '\'' +
                ", YB='" + YB + '\'' +
                ", pic='" + pic + '\'' +
                '}';
    }
}
