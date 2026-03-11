package model;

public class Design {
    private int id;
    private String category;
    private String room;
    private String style;
    private String image;
    private String name;
    private double price;
    private String description;

    // Constructors
    public Design() {}

    public Design(int id, String category, String room, String style, String image,
                  String name, double price, String description) {
        this.id = id;
        this.category = category;
        this.room = room;
        this.style = style;
        this.image = image;
        this.name = name;
        this.price = price;
        this.description = description;
    }

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getRoom() { return room; }
    public void setRoom(String room) { this.room = room; }

    public String getStyle() { return style; }
    public void setStyle(String style) { this.style = style; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}