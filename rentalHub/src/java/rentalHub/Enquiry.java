package rentalHub;

/**
 * Enquiry class with constructor and getters/setters.
 */
public class Enquiry {

    int enquiryid;
    String message;
    String status;
    String type;
    int userId;
    
     
    public Enquiry() {
    }

    // Parameterized constructor
    public Enquiry(int enquiryid, int userId, String type, String message, String status) {
        this.enquiryid = enquiryid;
        this.userId = userId;
        this.type = type;
        this.message = message;
        this.status = status;
    }

    // Getters and setters for properties
    public int getEnquiryid() {
        return enquiryid;
    }

    public void setEnquiryid(int enquiryid) {
        this.enquiryid = enquiryid;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
     @Override
    public String toString() {
        return "Enquiry{" +
                "userId=" + userId +
                ", type='" + type + '\'' +
                ", message='" + message + '\'' +
                '}';
    }

   
}
