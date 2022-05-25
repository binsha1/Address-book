
component persistent="true" entityname="contacts" table="contacts"  {
    property name="id" column="id" fieldtype="id" generator="increment";
    property name="title" column="title" ormtype="string";
    property name="fname" column="first_name" ormtype="string";
    property name="lname" column="last_name" ormtype="string";
    property name="gender" column="gender" ormtype="string";
    property name="dob" column="dob" ormtype="string";
    property name="file" column="user_photo" ormtype="string";
    property name="address" column="address" ormtype="string";
    property name="street" column="street_name" ormtype="string";
    property name="email" column="email_id" ormtype="string";
    property name="phone" column="phone" ormtype="string";
}  