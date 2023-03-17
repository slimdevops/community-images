package slim.sample.app

class User {
    String name
    String email
    String phone

    static constraints = {
        name size: 5..40, blank: false, unique: true
        email blank: false, unique: true, email: true
        phone size: 10..14, unique: true
    }

    String toString() {
        name
    }
}
